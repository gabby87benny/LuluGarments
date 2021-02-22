//
//  LuluGarmentsViewModelTests.swift
//  LuluGarmentsTests
//
//  Created by Gabriel on 2/22/21.
//

import XCTest
@testable import LuluGarments

class LuluGarmentsViewModelTests: XCTestCase {
    var subject: LGGarmentsViewModel!
    var mockDBManager: FakeLGDatabaseManager!
    
    override func setUpWithError() throws {
        mockDBManager = FakeLGDatabaseManager()
        subject = LGGarmentsViewModel(dbManager: mockDBManager)
    }

    override func tearDownWithError() throws {
        mockDBManager = nil
        subject = nil
    }

    func test_SaveGarments() {
        subject.saveGarments(name: "Garment 1") { (Bool, error) in
            
        }
        
        XCTAssertTrue(mockDBManager!.dbManager_SaveDataCalled)
    }
    
    func test_FetchGarments() {
        subject.retrieveGarments()
        XCTAssertTrue(mockDBManager!.dbManager_RetreiveDataCalled)
    }

}
