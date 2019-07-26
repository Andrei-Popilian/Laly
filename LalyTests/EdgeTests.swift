//
//  EdgeTests.swift
//  LalyTests
//
//  Created by Beta Catalina on 7/26/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import XCTest

class EdgeTests: XCTestCase {
    
    private var mainView: UIView!
    private var v: UIView!
    
    override func setUp() {
        mainView =  UIView()
        v = UIView(frame: CGRect(x: 5, y: 10, width: 50, height: 80))
        v.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(v)
        mainView.frame = CGRect(origin: CGPoint(x: 10, y: 5), size: CGSize(width: 20, height: 30))
    }
    
    func test_defaultEdges_toSuperView() {
        let constraints = v.laly.edges(to: mainView)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(constraints.count, 4)
        XCTAssertEqual(v.frame.height, mainView.frame.height, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.bounds.origin.x, mainView.bounds.origin.x, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.bounds.origin.x, mainView.bounds.origin.y, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultTopEdge_toSuperView() {
         v.laly.edge(to: mainView, of: .top)
        mainView.layoutIfNeeded()
        
         XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultBotEdge_toSuperView() {
        v.laly.edge(to: mainView, of: .bot)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.height, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultLeadingEdge_toSuperView() {
        v.laly.edge(to: mainView, of: .lead)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultTrailingEdge_toSuperView() {
        v.laly.edge(to: mainView, of: .trail)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.width, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultLeadAndTrailingEdge_toSuperView() {
        v.laly.edges(to: mainView, of: .lead, .trail)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.bounds.width, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultLeadTrailingAndTopEdge_toSuperView() {
        v.laly.edges(to: mainView, of: .lead, .trail, .top)
        mainView.layoutIfNeeded()
       
         XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.bounds.width, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    //MARK: - Constraints with Constants
    func test_edgesWithConstant_toSuperView() {
        let constraints = v.laly.edges(to: mainView, ofIdentation: 10)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(constraints.count, 4)
        XCTAssertEqual(v.frame.height, mainView.frame.height - 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.frame.width - 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x + 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_topWithConstant_toSuperView() {
        v.laly.edge(to: mainView, of: .topBy(10))
        mainView.layoutIfNeeded()
        
       XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_botWithConstant_toSuperView() {
        v.laly.edge(to: mainView, of: .botBy(10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.height + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_LeadingWithConstant_toSuperView() {
        v.laly.edge(to: mainView, of: .leadBy(10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_TrailingWithConstant_toSuperView() {
        v.laly.edge(to: mainView, of: .trailBy(-10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.width - 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_leadAndTrailingWithConstant_toSuperView() {
        v.laly.edges(to: mainView, of: .leadBy(10), .trailBy(-10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x + 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.bounds.width - 20, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    //MARK: - Constraints with Constants
    func test_topWithMultiply_toSuperView() {
        v.laly.edge(to: mainView, of: .topMultiply(2))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y * 2, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_botWithMultiply_toSuperView() {
        v.laly.edge(to: mainView, of: .botMultiply(2))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.height * 2, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_LeadingWithMultiply_toSuperView() {
        v.laly.edge(to: mainView, of: .leadMultiply(2))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x * 2, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_TrailingWithMultiply_toSuperView() {
        v.laly.edge(to: mainView, of: .trailMultiply(0.5))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.width / 2, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_leadAndTrailingWithMultiply_toSuperView() {
        v.laly.edges(to: mainView, of: .leadMultiply(2), .trailMultiply(0.5))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x * 2, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.bounds.width - 10, accuracy: CGFloat(Float.ulpOfOne))
    }

    func testsss() {
        
        v.laly.edge(to: mainView, of: .bot(>=10))
    }
    
    
//    func test_defaultTopEdge_toSuperView() {
//        let constraint = v.laly.edge(to: mainView, of: .top)
//        mainView.layoutIfNeeded()
//
//        XCTAssertTrue(constraint.firstItem is UIView)
//
//        let firstItem = constraint.firstItem as! UIView
//        let scondItem = constraint.secondItem as! UIView
//        XCTAssertTrue(constraint.firstAttribute == .top)
//        XCTAssertTrue(constraint.secondAttribute == .top)
//        XCTAssertTrue(constraint.constant == 0)
//        XCTAssertTrue(constraint.relation == .equal)
//        XCTAssertTrue(constraint.multiplier == 1)
//        XCTAssertTrue(firstItem == v)
//        XCTAssertTrue(scondItem == mainView)
//    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
