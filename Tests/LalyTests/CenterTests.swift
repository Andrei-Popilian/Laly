//
//  CenterTests.swift
//  LalyTests
//
//  Created by Beta Catalina on 7/25/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import XCTest

@available(iOS 9.0, *)
class CenterTests: XCTestCase {
    
    private var mainView: UIView!
    private var v: UIView!
    
    override func setUp() {
        mainView =  UIView()
        v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(v)
    }
    
    func test_centerX_onrelationView() {
        v.laly.center(to: mainView, on: .x)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.center.x, mainView.center.x, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_centerY_onrelationView() {
        v.laly.center(to: mainView, on: .y)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.center.y, mainView.center.y, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_centerYAndX_onrelationView() {
        v.laly.center(to: mainView, on: .x, .y)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.center.x, mainView.center.x, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.center.y, mainView.center.y, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_centerY_withConstant_onrelationView() {
        v.laly.center(to: mainView, on: .y(10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.center.y, mainView.center.y + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_centerX_withConstant_onrelationView() {
        v.laly.center(to: mainView, on: .x(20))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.center.x, mainView.center.x + 20, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_centerXAndY_withConstant_onrelationView() {
        v.laly.center(to: mainView, on: .x(20), .y(20))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.center.y, mainView.center.y + 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.center.x, mainView.center.x + 20, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_avoidDuplicatedCenters_withConstant_onrelationView_shouldFatalError() {
        expectFatalError {
            self.v.laly.center(to: self.mainView, on: .x(20), .y(20), .x(11))
            self.mainView.layoutIfNeeded()
        }
    }
    
    func test_avoidDuplicatedCenters_onrelationView_ShouldFataError() {
        expectFatalError {
            self.v.laly.center(to: self.mainView, on: .x, .y, .x)
            self.mainView.layoutIfNeeded()
        }
    }
}
