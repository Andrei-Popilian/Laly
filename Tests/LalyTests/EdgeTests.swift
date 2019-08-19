//
//  EdgeTests.swift
//  LalyTests
//
//  Created by Beta Catalina on 7/26/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import XCTest

@available(iOS 9.0, *)
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
    
    func test_defaultEdges_torelationView() {
        let constraints = v.laly.edges(to: mainView)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(constraints.count, 4)
        XCTAssertEqual(v.frame.height, mainView.frame.height, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.bounds.origin.x, mainView.bounds.origin.x, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.bounds.origin.x, mainView.bounds.origin.y, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultTopEdge_torelationView() {
        v.laly.edge(to: mainView, of: .top)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultBotEdge_torelationView() {
        v.laly.edge(to: mainView, of: .bot)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.height, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultLeadingEdge_torelationView() {
        v.laly.edge(to: mainView, of: .lead)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultTrailingEdge_torelationView() {
        v.laly.edge(to: mainView, of: .trail)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.width, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultLeadAndTrailingEdge_torelationView() {
        v.laly.edges(to: mainView, of: .lead, .trail)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.bounds.width, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_defaultLeadTrailingAndTopEdge_torelationView() {
        v.laly.edges(to: mainView, of: .lead, .trail, .top)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.bounds.width, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    //MARK: - Constraints with Constants
    func test_edgesWithConstant_torelationView() {
        let constraints = v.laly.edges(to: mainView, ofIdentation: 10)
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(constraints.count, 4)
        XCTAssertEqual(v.frame.height, mainView.frame.height - 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.frame.width - 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x + 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_topWithConstant_torelationView() {
        v.laly.edge(to: mainView, of: .topBy(10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_botWithConstant_torelationView() {
        v.laly.edge(to: mainView, of: .botBy(10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.height + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_LeadingWithConstant_torelationView() {
        v.laly.edge(to: mainView, of: .leadBy(10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_TrailingWithConstant_torelationView() {
        v.laly.edge(to: mainView, of: .trailBy(-10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.width - 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_leadAndTrailingWithConstant_torelationView() {
        v.laly.edges(to: mainView, of: .leadBy(10), .trailBy(-10))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x + 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.bounds.width - 20, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    //MARK: - Constraints with Constants
    func test_topWithMultiply_torelationView() {
        v.laly.edge(to: mainView, of: .topMultiply(2))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y * 2, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_botWithMultiply_torelationView() {
        v.laly.edge(to: mainView, of: .botMultiply(2))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.height * 2, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_LeadingWithMultiply_torelationView() {
        v.laly.edge(to: mainView, of: .leadMultiply(2))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x * 2, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_TrailingWithMultiply_torelationView() {
        v.laly.edge(to: mainView, of: .trailMultiply(0.5))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.width / 2, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_leadAndTrailingWithMultiply_torelationView() {
        v.laly.edges(to: mainView, of: .leadMultiply(2), .trailMultiply(0.5))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x * 2, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, mainView.bounds.width - 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_leadToLeadByRelation_TorelationView() {
        v.laly.edge(to: mainView, relation: (.lead, to: .leadBy(5)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x + 5, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_leadToTrailByRelation_TorelationView() {
        v.laly.edge(to: mainView, relation: (.lead, to: .trailBy(5)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.x, mainView.bounds.origin.x + mainView.bounds.width + 5, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_topToTopByRelation_TorelationView() {
        v.laly.edge(to: mainView, relation: (.top, to: .topBy(10)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y + 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_topToBotByRelation_torelationView() {
        v.laly.edge(to: mainView, relation: (.top, to: .botBy(-10)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y + mainView.bounds.height - 10, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func test_topToTopByRelation_andBotToBotByRelation_torelationView() {
        v.laly.edges(to: mainView, relations: (.top, to: .topBy(10)), (.bot, to: .botBy(-10)))
        mainView.layoutIfNeeded()
        
        XCTAssertEqual(v.frame.origin.y, mainView.bounds.origin.y + 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height + v.frame.origin.y, mainView.bounds.origin.y + mainView.bounds.height - 10, accuracy: CGFloat(Float.ulpOfOne))
    }
}
