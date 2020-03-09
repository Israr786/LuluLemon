//
//  ViewControllerTests.swift
//  LuluLemonTests
//
//  Created by Apple on 3/7/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest
@testable import LuluLemon

class ViewControllerTests: XCTestCase {

    var sut: ViewController!
   
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ViewController()
        sut.loadView()
        sut.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHasATableView() {
        XCTAssertNotNil(sut.tableView)
    }
       
    func testTableViewHasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }
       
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
    }
       
    func testTableViewHasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
       
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }

    func testViewisLoaded(){
        //Given
        
        //When
        sut.viewDidLoad()
        //Then
        XCTAssertTrue(sut.isViewLoaded)
    }
    
    func testAddGarmentTextFailed() {
        //Given
        sut.arrayData = ["test","lok"]
        sut.handleAdd()
        
        //Then
        XCTAssertFalse(sut.arrayData.contains(""))
    }
    
    func testAddGarmentTextSuccessful() {
        //Given
        sut.arrayData = ["test","lok"]
        
        //When
        sut.handleAdd()
        
        //Then
        XCTAssertTrue(sut.arrayData.contains("test"))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
