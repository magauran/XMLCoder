//
//  KeyPathWrapper.swift
//  XMLCoder
//
//  Created by Alexey Salangin on 13/03/2019.
//

let keyPathUserInfoKey = CodingUserInfoKey(rawValue: "keyPathUserInfoKey")!

class KeyPathWrapper<T: Decodable>: Decodable {
    enum KeyPathError: Error {
        case `internal`
    }

    struct Key: CodingKey {
        init?(intValue: Int) {
            self.intValue = intValue
            stringValue = String(intValue)
        }

        init?(stringValue: String) {
            self.stringValue = stringValue
            intValue = nil
        }

        let intValue: Int?
        let stringValue: String
    }

    typealias KeyedContainer = KeyedDecodingContainer<KeyPathWrapper<T>.Key>

    required init(from decoder: Decoder) throws {
        guard let keyPath = decoder.userInfo[keyPathUserInfoKey] as? [String],
            !keyPath.isEmpty
            else { throw KeyPathError.internal }

        /// Creates a `Key` from the first keypath element.
        func getKey(from keyPath: [String]) throws -> Key {
            guard let first = keyPath.first,
                let key = Key(stringValue: first)
                else { throw KeyPathError.internal }
            return key
        }

        /// Finds nested container and returns it and the key for object.
        func objectContainer(for keyPath: [String],
                             in currentContainer: KeyedContainer,
                             key currentKey: Key) throws -> (KeyedContainer, Key) {

            guard
                !keyPath.isEmpty,
                (!currentContainer.allKeys.contains(where: { $0.stringValue == keyPath.last! }))
                else { return (currentContainer, currentKey) }
            let container = try currentContainer.nestedContainer(keyedBy: Key.self, forKey: currentKey)
            let actualKeyPath = Array(keyPath.dropFirst())
            let key = try getKey(from: actualKeyPath)
            return try objectContainer(for: actualKeyPath, in: container, key: key)
        }

        let actualKeyPath = Array(keyPath.dropFirst())
        let rootKey = try getKey(from: actualKeyPath)
        let rootContainer = try decoder.container(keyedBy: Key.self)

        let (keyedContainer, key) = try objectContainer(for: actualKeyPath, in: rootContainer, key: rootKey)
        object = try keyedContainer.decode(T.self, forKey: key)
    }

    let object: T
}
