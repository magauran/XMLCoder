//
//  FileAttachment.swift
//  XMLCoderTests
//
//  Created by Игорь Талов on 15/03/2019.
//

public struct FileAttachment: Decodable {
    var attachmentId: AttachmentId
    var name: String
    var contentId: String
    var contentType: String
    var size: Int?
    var isInLine: Bool?
    var content: String?
    var isContactPhoto: Bool?
    var lastModifiedTime: String?

    enum CodingKeys: String, CodingKey {
        case attachmentId = "t:AttachmentId"
        case name = "t:Name"
        case contentId = "t:ContentId"
        case contentType = "t:ContentType"
        case size = "t:Size"
        case isInLine = "t:IsInLine"
        case content = "t:Content"
        case isContactPhoto = "t:IsContactPhoto"
        case lastModifiedTime = "t:LastModifiedTime"
    }
}

struct AttachmentId: Decodable {
    var identifier: String

    enum CodingKeys: String, CodingKey {
        case identifier = "Id"
    }
}
