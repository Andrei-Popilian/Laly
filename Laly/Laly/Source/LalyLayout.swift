//
//  LalyLayout.swift
//  Laly
//
//  Created by Beta Catalina on 7/19/19.
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
        
        #warning("must check if both have the same no of elements")
        
        var index: Int = 0
        for e in self {
            guard let p = priorities[index] else {
                index += 1
                continue
            }
            
            e.priority = p
            index += 1
        }
        
        return self
    }
}

