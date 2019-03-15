//
//  Attachments.swift
//  XMLCoderTests
//
//  Created by Игорь Талов on 15/03/2019.
//

public struct Attachments: Decodable {
    var attachments: [FileAttachment]

    enum CodingKeys: String, CodingKey {
        case attachments = "t:FileAttachment"
    }
}
