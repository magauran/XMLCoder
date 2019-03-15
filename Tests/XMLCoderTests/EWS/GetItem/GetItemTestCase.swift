//
//  GetItemTestCase.swift
//  XMLCoderTests
//
//  Created by Игорь Талов on 15/03/2019.
//

import XCTest

class GetItemTestCase: XMLFileTestCase {
    /// XMLFileName Protocol
    override var fileName: String {
        return "GetItemsResponse.xml"
    }

    private func verify(_ message: Message) {
        XCTAssertEqual(message.subject, "Скидки до 50%. Скоро!")
        XCTAssertEqual(message.itemId.identifier, "AAMkAGMwZDBmNWQ3LTEyN2YtNDNkNi05MT=")
        XCTAssertEqual(message.attachments?.attachments.count, 3, "Message attachments count and test count are not equal")
        XCTAssertEqual(message.sender?.mailbox.emailAddress, "s7news@e.s7.ru", "Message sender emailAddress and test string are not equal")
        XCTAssertEqual(message.sender?.mailbox.name, "S7 Airlines", "Message sender name and test string are not equal")
        XCTAssertEqual(message.body?.value, "Успейте подготовиться к распродаже!", "Message body and test string are not equal")
    }

    func testGetResponseCode() {
        let testBlock = {
            let data = try Data(contentsOf: self.fileURL)
            let keyPath = "s:Envelope.s:Body.m:GetItemResponse.m:ResponseMessages.m:GetItemResponseMessage"
            let responseCodes = try self.decoder.decode([ResponseCode].self, from: data, keyPath: keyPath, keyPathSeparator: ".")
            let responseCode: ResponseCode! = responseCodes[0]
            XCTAssertEqual(responseCode.status, "NoError", "Неверное значение переменной ResponseCode.status <m:ResponseCode>.")
        }
        XCTAssertNoThrow(try testBlock())
    }

    func testGetItems() {
        let testBlock = {
            let data = try Data(contentsOf: self.fileURL)
            let keyPath = "s:Envelope.s:Body.m:GetItemResponse.m:ResponseMessages.m:GetItemResponseMessage.m:Items.t:Message"
            let message = try self.decoder.decode(Message.self, from: data, keyPath: keyPath)
            self.verify(message)
        }
        XCTAssertNoThrow(try testBlock())
    }
}
