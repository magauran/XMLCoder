//
//  RecipientAddress.swift
//  XMLCoderTests
//
//  Created by Игорь Талов on 15/03/2019.
//

struct RecipientAddress: Decodable {
    public private(set) var mailbox: Mailbox

    enum CodingKeys: String, CodingKey {
        case mailbox = "t:Mailbox"
    }
}
