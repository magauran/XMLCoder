//
//  GetFolderTestCase.swift
//  XMLCoderTests
//
//  Created by Developer on 10/10/2018.
//  Copyright © 2018 DigDes. All rights reserved.
//

import XCTest

class GetFolderTestCase: XMLFileTestCase {
    /// XMLFileName Protocol
    override var fileName: String {
        return "GetFolderResponse.xml"
    }

    private func verify(_ folder: GetFolder.Folder) {
        XCTAssertEqual(folder.title, "Top of Information Store")
        XCTAssertEqual(folder.count, 0)
        XCTAssertEqual(folder.folderId.identifier, "AAMkAGIC/tTqSH9VGo+ou5AAAAMTxnAAA=")
    }

    func testGetResponseCode() {
        let testBlock = {
            let data = try Data(contentsOf: self.fileURL)
            let keyPath = "s:Envelope.s:Body.m:GetFolderResponse.m:ResponseMessages.m:GetFolderResponseMessage"
            let responseCode = try self.decoder.decode(GetFolder.ResponseCode.self, from: data, keyPath: keyPath)
            XCTAssertEqual(responseCode.status, "NoError", "Неверное значение переменной ResponseCode.status <m:ResponseCode>.")
        }
        XCTAssertNoThrow(try testBlock())
    }

    func testGetFolders() {
        let testBlock = {
            let data = try Data(contentsOf: self.fileURL)
            let keyPath = "s:Envelope.s:Body.m:GetFolderResponse.m:ResponseMessages.m:GetFolderResponseMessage.m:Folders.t:Folder"
            let folders = try self.decoder.decode([GetFolder.Folder].self, from: data, keyPath: keyPath)
            let folder: GetFolder.Folder! = folders[1]
            XCTAssertNotNil(folder, "Список папок пуст.")
            self.verify(folder)
        }
        XCTAssertNoThrow(try testBlock())
    }
}
