//
//  Mailbox.swift
//  XMLCoderTests
//
//  Created by Игорь Талов on 15/03/2019.
//

public struct Mailbox: Decodable {
    var name: String?
    var emailAddress: String?
    var maillBoxType: MailBoxType?
    var routingType: String?
    var itemId: ItemId?

    enum CodingKeys: String, CodingKey {
        case name = "t:Name"
        case emailAddress = "t:EmailAddress"
        case maillBoxType = "t:MailboxType"
        case routingType = "t:RoutingType"
    }
}

enum MailBoxType: String, Decodable {
    case mailbox = "Mailbox"
    case publicDL = "PublicDL"
    case privateDL = "PrivateDL"
    case contact = "Contact"
    case publicFolder = "PublicFolder"
    case unknown = "Unknown"
    case oneOff = "OneOff"
    case groupMailbox = "GroupMailbox"
}
