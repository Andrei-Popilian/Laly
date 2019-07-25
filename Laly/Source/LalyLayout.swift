//
//  LalyLayout.swift
//  Laly
//
//  Created by Andrei Popilian on 7/19/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public struct LalyLayout {
    
    let layout: Constraintable
    
    init(constrainableLayout: Constraintable) {
        self.layout = constrainableLayout
    }
}

public enum LalyLayoutRelation {
    case greaterThanOrEqual
    case lessThanOrEqual
}

public struct LalyMargin {
    var points: CGFloat
    var relation: LalyLayoutRelation
}

prefix operator >=
@discardableResult
public prefix func >= (p: CGFloat) -> LalyMargin {
    return LalyMargin(points: p, relation: .greaterThanOrEqual)
}

prefix operator <=
@discardableResult
public prefix func <= (p: CGFloat) -> LalyMargin {
    return LalyMargin(points: p, relation: .lessThanOrEqual)
}


public extension NSLayoutConstraint {
    
    @discardableResult
    func activated() -> Self {
        self.isActive = true
        return self
    }
    
    @discardableResult
    func deactivated() -> Self {
        self.isActive = false
        return self
    }
    
    @discardableResult
    func prioritized(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}

public extension UIView {
    
    var laly: LalyLayout {
        return LalyLayout(constrainableLayout: self)
    }
    
}

public extension UILayoutGuide {
    
    var laly: LalyLayout {
        return LalyLayout(constrainableLayout: self)
    }
}


public extension Sequence where Element: NSLayoutConstraint {
    
    @discardableResult
    func activated() -> Self {
        self.forEach { $0.isActive = true }
        return self
    }
    
    @discardableResult
    func deactivated() -> Self {
        self.forEach { $0.isActive = false }
        return self
    }
    
    @discardableResult
    func prioritized(_ priorities: UILayoutPriority?...) -> Self {
        
        for (i, e) in self.enumerated() {
            if let p = priorities[i] {
                e.priority = p
            }
        }
        
        return self
    }
}

