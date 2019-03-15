//
//  Body.swift
//  XMLCoderTests
//
//  Created by Игорь Талов on 15/03/2019.
//

public struct Body: Decodable {
    var bodyType: BodyType
    var value: String

    enum CodingKeys: String, CodingKey {
        case value
        case bodyType = "BodyType"
    }
}

enum BodyType: String, Decodable {
    case best = "Best"
    case html = "HTML"
    case text = "Text"
}
