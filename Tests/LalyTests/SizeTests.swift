//
//  SizeTests.swift
//  LalyTests
//
//  Created by Beta Catalina on 7/25/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import XCTest

@available(iOS 9.0, *)
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

    func test_widthEqual_torelationView() {
        v.laly.size(of: mainView, on: .width)
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.width, mainView.frame.width, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_heightEqual_torelationView() {
        v.laly.size(of: mainView, on: .height)
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.height, mainView.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_heightAndWidthEqual_torelationView() {
        v.laly.size(of: mainView)
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.width, mainView.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, mainView.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_heightEqual_torelationView_withConstant() {
        v.laly.size(of: mainView, relation: (.height, to: .heightBy(50)))
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.height, mainView.frame.height + 50, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_widthEqual_torelationView_withConstant() {
        v.laly.size(of: mainView, relation: (.width, to: .widthBy(50)))
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.width, mainView.frame.width + 50, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_heightEqual_torelationView_withMultiplier() {
        v.laly.size(of: mainView, relation: (.height, to: .heightMultiply(50)))
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.height, mainView.frame.height * 50, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_widthEqual_torelationView_withMultiplier() {
        v.laly.size(of: mainView, relation: (.width, to: .widthMultiply(50)))
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.width, mainView.frame.width * 50, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_heightEqual_toWidth_ofrelationView() {
        v.laly.size(of: mainView, relation: (.height, to: .widthBy(0)))
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.height, mainView.frame.width, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_widthEqual_toHeight_ofrelationView() {
        v.laly.size(of: mainView, relation: (.width, to: .heightBy(0)))
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.width, mainView.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_widthEqual_toHeight_plusConstant_ofrelationView() {
        v.laly.size(of: mainView, relation: (.width, to: .heightBy(30)))
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.width, mainView.frame.height + 30, accuracy: CGFloat(Float.ulpOfOne))
    }

    func test_heightEqual_toHeight_plusConstant_ofrelationView() {
        v.laly.size(of: mainView, relation: (.height, to: .heightBy(30)))
        mainView.layoutIfNeeded()

        XCTAssertEqual(v.frame.height, mainView.frame.height + 30, accuracy: CGFloat(Float.ulpOfOne))
    }

}
