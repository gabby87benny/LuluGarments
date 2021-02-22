//
//  LGDatabaseManagerTests.swift
//  LuluGarmentsTests
//
//  Created by Gabriel on 2/22/21.
//

import XCTest
@testable import LuluGarments

class LGDatabaseManagerTests: XCTestCase {
    var subject: LGDatabaseManager!
    
    override func setUpWithError() throws {
        subject = LGDatabaseManager()
    }

    override func tearDownWithError() throws {
        subject = nil
    }

    func test_SaveOperation_Database() {
        subject.saveData(garmentName: "Garment1") { (isSaved, error) in
            XCTAssertEqual(subject.dbError, LGDatabaseError.LGDatabaseErrorNone)
            XCTAssertTrue(isSaved)
        }
    }
    
    func test_RetrieveOperation_Database() {
        subject.retrieveData { (garments, error) -> (Void) in
            XCTAssertEqual(subject.dbError, LGDatabaseError.LGDatabaseErrorNone)
            XCTAssertGreaterThan(garments.count, 0)
        }
    }
}
