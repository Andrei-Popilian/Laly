//
//  SizeTests.swift
//  LalyTests
//
//  Created by Beta Catalina on 7/25/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import XCTest

class SizeTests: XCTestCase {
    
    private var mainView: UIView!
    private var v: UIView!
    
    override func setUp() {
        mainView =  UIView()
        v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(v)
        mainView.frame = CGRect(origin: .zero, size: CGSize(width: 20, height: 30))
    }
    
    func test_setDefaultHeight() {
        v.laly.size(.height(40))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.height, 40, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_setDefaultWidth() {
        v.laly.size(.width(50))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.width, 50, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_setDefault_WidthAndHeight() {
        v.laly.size(.width(50), .height(40))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.width, 50, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 40, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_avoidDuplicates_whenSetDefault_WidthAndHeight_shouldFatalError() {
        expectFatalError {
            self.v.laly.size(.width(50), .height(40), .width(20))
            self.mainView.layoutIfNeeded()
        }
    }
    
    
    func test_widthEqual_toSuperView() {
        v.laly.size(of: mainView, on: .width)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.width, mainView.frame.width, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_heightEqual_toSuperView() {
        v.laly.size(of: mainView, on: .height)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.height, mainView.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_heightAndWidthEqual_toSuperView() {
        v.laly.size(of: mainView)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.width, mainView.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, mainView.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_heightEqual_toSuperView_withConstant() {
        v.laly.size(of: mainView, relation: (.height, to: .heightBy(50)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.height, mainView.frame.height + 50, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_widthEqual_toSuperView_withConstant() {
        v.laly.size(of: mainView, relation: (.width, to: .widthBy(50)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.width, mainView.frame.width + 50, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_heightEqual_toSuperView_withMultiplier() {
        v.laly.size(of: mainView, relation: (.height, to: .heightMultiply(50)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.height, mainView.frame.height * 50, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_widthEqual_toSuperView_withMultiplier() {
        v.laly.size(of: mainView, relation: (.width, to: .widthMultiply(50)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.width, mainView.frame.width * 50, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_heightEqual_toWidth_ofSuperView() {
        v.laly.size(of: mainView, relation: (.height, to: .widthBy(0)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.height, mainView.frame.width, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_widthEqual_toHeight_ofSuperView() {
        v.laly.size(of: mainView, relation: (.width, to: .heightBy(0)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.width, mainView.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_widthEqual_toHeight_plusConstant_ofSuperView() {
        v.laly.size(of: mainView, relation: (.width, to: .heightBy(30)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.width, mainView.frame.height + 30, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_heightEqual_toHeight_plusConstant_ofSuperView() {
        v.laly.size(of: mainView, relation: (.height, to: .heightBy(30)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.height, mainView.frame.height + 30, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    #warning("This  should be fixed")
//    func test_heightLessOrEqual_toHeight_plusConstant_ofSuperView() {
//        let const = v.laly.size(of: mainView, relation: (.height, to: .height(<=30)))
//        mainView.layoutIfNeeded()
//        
//        XCTAssertTrue(const.relation == .lessThanOrEqual)
//        XCTAssertTrue(const.constant == 30)
//    }
//    
//    func test_heightGreaterOrEqual_toHeight_plusConstant_ofSuperView() {
//        let const = v.laly.size(of: mainView, relation: (.height, to: .height(>=30)))
//        mainView.layoutIfNeeded()
//        
//        XCTAssertTrue(const.relation == .greaterThanOrEqual)
//        XCTAssertTrue(const.constant == 30)
//    }
//    
//    func test_widthGreaterOrEqual_toConstant() {
//        let const = v.laly.size(.width(>=30))
//        mainView.layoutIfNeeded()
//        
//        XCTAssertTrue(const.relation == .greaterThanOrEqual)
//        XCTAssertTrue(const.constant == 30)
//    }
    
}
