//
//  FindFolder.swift
//  XMLCoderTests
//
//  Created by Developer on 15/10/2018.
//  Copyright © 2018 DigDes. All rights reserved.
//

struct FindFolder {
    struct Folders: Decodable {
        var folders: [Folder]
        var searchFolders: [Folder]
        var calendarFolders: [Folder]
        var contactsFolders: [Folder]

        enum CodingKeys: String, CodingKey { // swiftlint:disable:this nesting
            case folders = "t:Folder"
            case searchFolders = "t:SearchFolder"
            case calendarFolders = "t:CalendarFolder"
            case contactsFolders = "t:ContactsFolder"
        }
    }

    struct Folder: Decodable {
        var folderId: FolderId
        var displayName: String

        enum CodingKeys: String, CodingKey { // swiftlint:disable:this nesting
            case folderId = "t:FolderId"
            case displayName = "t:DisplayName"
        }
    }

    struct FolderId: Decodable {
        var identifier: String

        enum CodingKeys: String, CodingKey { // swiftlint:disable:this nesting
            case identifier = "Id"
        }
    }
}
