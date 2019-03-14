//
//  GetFolder.swift
//  XMLCoderTests
//
//  Created by Developer on 01/10/2018.
//  Copyright © 2018 DigDes. All rights reserved.
//

struct GetFolder {
    struct ResponseCode: Decodable {
        var status: String

        enum CodingKeys: String, CodingKey { // swiftlint:disable:this nesting
            case status = "m:ResponseCode"
        }
    }

    struct Folder: Decodable {
        var folderId: FolderId
        var title: String
        var count: Int
        var effeciveRights: EffeciveRights
        var unreadCount: Int?

        enum CodingKeys: String, CodingKey { // swiftlint:disable:this nesting
            case folderId = "t:FolderId"
            case title = "t:DisplayName"
            case count = "t:TotalCount"
            case effeciveRights = "t:EffectiveRights"
            case unreadCount = "t:UnreadCount"
        }
    }

    struct FolderId: Decodable {
        var identifier: String

        enum CodingKeys: String, CodingKey { // swiftlint:disable:this nesting
            case identifier = "Id"
        }
    }

    struct EffeciveRights: Decodable {
        var createAssociated: Bool
        var createContents: Bool

        enum CodingKeys: String, CodingKey { // swiftlint:disable:this nesting
            case createAssociated = "t:CreateAssociated"
            case createContents = "t:CreateContents"
        }
    }
}
