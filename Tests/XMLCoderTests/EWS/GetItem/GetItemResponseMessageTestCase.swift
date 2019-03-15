//
//  GetItemResponseMessageTestCase.swift
//  XMLCoderTests
//
//  Created by Игорь Талов on 15/03/2019.
//

import XCTest

class GetItemResponseMessageTestCase: XMLFileTestCase {
    /// XMLFileName Protocol
    override var fileName: String {
        return "GeetItemResponseMessages.xml"
    }

    func testGetItemResponseMessage() {
        let testBlock = {
            let data = try Data(contentsOf: self.fileURL)
            let keyPath = "s:Envelope.s:Body.m:GetItemResponse.m:ResponseMessages.m:GetItemResponseMessage"
            let responseMessages = try self.decoder.decode([GetItemResponseMessage].self, from: data, keyPath: keyPath)
            XCTAssertEqual(responseMessages.count, 10, "Response messages count and test count are not equal")
        }
        XCTAssertNoThrow(try testBlock())
    }
}
