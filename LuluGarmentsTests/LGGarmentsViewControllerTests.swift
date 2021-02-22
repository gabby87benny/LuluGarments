//
//  LGGarmentsViewControllerTests.swift
//  LuluGarmentsTests
//
//  Created by Gabriel on 2/18/21.
//

import XCTest
@testable import LuluGarments

class LGGarmentsViewControllerTests: XCTestCase {
    var sut: LGGarmentsViewController!
    
    override func setUpWithError() throws {
        sut = LGGarmentsViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testHasATableView() {
        if (sut.isViewLoaded) {
            XCTAssertNotNil(sut.garmentsTableView)
        }
    }
       
    func testTableViewHasDelegate() {
        if (sut.isViewLoaded) {
            XCTAssertNotNil(sut.garmentsTableView.delegate)
        }
    }
       
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
    }
       
    func testTableViewHasDataSource() {
        if (sut.isViewLoaded) {
            XCTAssertNotNil(sut.garmentsTableView.dataSource)
        }
    }
       
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }

}
