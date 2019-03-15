//
//  FindFolderTestCase.swift
//  XMLCoderTests
//
//  Created by Developer on 15/10/2018.
//  Copyright © 2018 DigDes. All rights reserved.
//

import XCTest

class FindFolderTestCase: XMLFileTestCase {
    /// XMLFileName Protocol
    override var fileName: String {
        return "FindFolderResponse.xml"
    }

    private func verify(_ folderList: FindFolder.Folders) {
        verifyFolders(in: folderList)
        verifySearchFolders(in: folderList)
        verifyCalendarFolders(in: folderList)
        verifyContactsFolders(in: folderList)
    }

    func verifyFolders(in folderList: FindFolder.Folders) {
        let folders = folderList.folders
        for index in folders.indices {
            let folder = folders[index]
            switch index {
            case 0:
                XCTAssertEqual(folder.displayName, "Freebusy Data")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            case 1:
                XCTAssertEqual(folder.displayName, "Recoverable Items")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            case 2:
                XCTAssertEqual(folder.displayName, "Deletions")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            case 3:
                XCTAssertEqual(folder.displayName, "Deleted Items")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            case 4:
                XCTAssertEqual(folder.displayName, "Inbox")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            default:
                break
            }
        }
    }

    func verifySearchFolders(in folderList: FindFolder.Folders) {
        let searchFolders = folderList.searchFolders
        for index in searchFolders.indices {
            let folder = searchFolders[index]
            switch index {
            case 0:
                XCTAssertEqual(folder.displayName, "AllItems")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            case 1:
                XCTAssertEqual(folder.displayName, "NoArchiveTagSearchFolder8534F96D-4183-41fb-8A05-9B7112AE2100")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            case 2:
                XCTAssertEqual(folder.displayName, "Unread Mail")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            default:
                break
            }
        }
    }

    func verifyCalendarFolders(in folderList: FindFolder.Folders) {
        let calendarFolders = folderList.calendarFolders
        for index in calendarFolders.indices {
            let folder = calendarFolders[index]
            switch index {
            case 0:
                XCTAssertEqual(folder.displayName, "Calendar")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            default:
                break
            }
        }
    }

    func verifyContactsFolders(in folderList: FindFolder.Folders) {
        let contactsFolders = folderList.contactsFolders
        for index in contactsFolders.indices {
            let folder = contactsFolders[index]
            switch index {
            case 0:
                XCTAssertEqual(folder.displayName, "Contacts")
                XCTAssertEqual(folder.folderId.identifier, "AQMkAGEyYzQ")
            default:
                break
            }
        }
    }

    func testFindFolder() {
        let testBlock = {
            let data = try Data(contentsOf: self.fileURL)
            let keyPath = "s:Envelope.s:Body.m:FindFolderResponse.m:ResponseMessages.m:FindFolderResponseMessage.m:RootFolder.t:Folders"
            let folders = try self.decoder.decode(FindFolder.Folders.self, from: data, keyPath: keyPath)

            XCTAssertEqual(folders.folders.count, 5)
            XCTAssertEqual(folders.calendarFolders.count, 1)
            XCTAssertEqual(folders.contactsFolders.count, 1)
            XCTAssertEqual(folders.searchFolders.count, 3)

            self.verify(folders)
        }
        XCTAssertNoThrow(try testBlock())
    }
}
