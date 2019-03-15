//
//  GetItemResponseMessage.swift
//  XMLCoderTests
//
//  Created by Игорь Талов on 15/03/2019.
//

struct GetItemResponseMessage: Decodable {
    var responseClass: String
    var responseCode: String
    var items: Items

    enum CodingKeys: String, CodingKey {
        case responseClass = "ResponseClass"
        case responseCode = "m:ResponseCode"
        case items = "m:Items"
    }
}

struct Items: Decodable {
    var messages: [Message]

    enum CodingKeys: String, CodingKey {
        case messages = "t:Message"
    }
}
