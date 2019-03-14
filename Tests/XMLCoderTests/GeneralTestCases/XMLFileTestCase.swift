//
//  XMLFileTestCase.swift
//  XMLCoderTests
//
//  Created by Developer on 10/10/2018.
//  Copyright © 2018 DigDes. All rights reserved.
//

import XCTest
@testable import XMLCoder

class XMLFileTestCase: XCTestCase {
    var fileURL: URL!
    var decoder: XMLDecoder!

    private var bundle: Bundle!

    override func setUp() {
        super.setUp()

        let bundle = Bundle(for: type(of: self))
        guard let fileURL = bundle.url(forResource: fileName, withExtension: nil) else {
            XCTFail("Файл \"\(fileName)\" не найден")
            return
        }
        self.fileURL = fileURL
        self.decoder = XMLDecoder()
    }
}

extension XMLFileTestCase: XMLFileName {
    /// XMLFileName Protocol
    var fileName: String {
        fatalError("fileName property must be overriden")
    }
}

protocol XMLFileName {
    var fileName: String { get }
}
