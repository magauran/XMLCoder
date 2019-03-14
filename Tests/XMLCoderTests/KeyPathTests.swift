//
//  KeyPathTests.swift
//  XMLCoder
//
//  Created by Alexey Salangin on 13/03/2019.
//

import Foundation
import XCTest
@testable import XMLCoder

class KeyPathTest: XCTestCase {
    private struct User: Decodable, Equatable {
        let name: String
        let age: Int
    }

    private let xmlData = """
        <user>
            <boom>
                <test>
                    <name>Alexey</name>
                    <age>21</age>
                </test>
            </boom>
        </user>
    """.data(using: .utf8)!

    func testDecoder() throws {
        let decoder = XMLDecoder()
        let decoded = try decoder.decode(User.self, from: xmlData, keyPath: "user.boom.test")
        XCTAssertEqual(decoded, User(name: "Alexey", age: 21))
    }
}
