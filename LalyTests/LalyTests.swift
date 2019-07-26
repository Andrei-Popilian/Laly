//
//  LalyTests.swift
//  LalyTests
//
//  Created by Beta Catalina on 7/25/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import XCTest
import Laly

class LalyTests: XCTestCase {
    
    var mainView: UIView!
    var v: UIView!
    
    override func setUp() {
        super.setUp()
        mainView =  UIView()
        v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(v)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSizeHeight() {
        v.laly.size(.height(10))
        mainView.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        XCTAssertEqual(v.frame.height, 10, accuracy: CGFloat(Float.ulpOfOne))
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
