//
//  Message.swift
//  XMLCoder
//
//  Created by Игорь Талов on 15/03/2019.
//

typealias ItemId = ExchangeId
typealias Sender = RecipientAddress

struct ResponseCode: Decodable {
    var status: String

    enum CodingKeys: String, CodingKey {
        case status = "m:ResponseCode"
    }
}

public struct ExchangeId: Decodable {
    var identifier: String
    var changeKey: String

    enum CodingKeys: String, CodingKey {
        case identifier = "Id"
        case changeKey = "ChangeKey"
    }
}

public struct Message: Decodable {
    var itemId: ItemId
    var parentFolderId: ItemId?
    var itemClass: String?
    var subject: String?
    var sensitivity: String?
    var dateTimeReceived: String?
    var size: Int?
    var inReplyTo: String?
    var isSubmitted: Bool?
    var isDraft: Bool?
    var isFromMe: Bool?
    var isResend: Bool?
    var sender: Sender?
    var isUnmodified: Bool?
    var dateTimeSent: String?
    var dateTimeCreated: String?
    var displayCc: String?
    var displayTo: String?
    var hasAttachments: Bool?
    var attachments: Attachments?
    var lastModifiedName: String?
    var lastModifiedTime: String?
    var webClientReadFormQueryString: String?
    var conversationIndex: String?
    var conversationTopic: String?
    var internetMessageId: String?
    var isRead: Bool?
    var body: Body?

    enum CodingKeys: String, CodingKey {
        case itemId = "t:ItemId"
        case parentFolderId = "t:ParentFolderId"
        case itemClass = "t:ItemClass"
        case subject = "t:Subject"
        case sensitivity = "t:Sensitivity"
        case dateTimeReceived = "t:DateTimeReceived"
        case size = "t:Size"
        case inReplyTo = "t:InReplyTo"
        case isSubmitted = "t:IsSubmitted"
        case isDraft = "t:IsDraft"
        case isFromMe = "t:IsFromMe"
        case isResend = "t:IsResend"
        case sender = "t:Sender"
        case dateTimeCreated = "t:DateTimeCreated"
        case hasAttachments = "t:HasAttachments"
        case attachments = "t:Attachments"
        case lastModifiedName = "t:LastModifiedName"
        case lastModifiedTime = "t:LastModifiedTime"
        case webClientReadFormQueryString = "t:WebClientReadFormQueryString"
        case conversationIndex = "t:ConversationIndex"
        case conversationTopic = "t:ConversationTopic"
        case internetMessageId = "t:InternetMessageId"
        case isRead = "t:IsRead"
        case body = "t:Body"
    }
}
