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
    
     internal func constraintWithAttributor(_ attributor: LalyLayoutAttributor, _ selfAttribute: NSLayoutConstraint.Attribute, _ superView: Constraintable?) -> NSLayoutConstraint {
        
         NSLayoutConstraint(item: layout, attribute: selfAttribute, relatedBy: attributor.relation, toItem: superView, attribute: attributor.attribute, multiplier: attributor.multiplier, constant: attributor.constant)
            .activated()
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

public struct LalyLayoutAttributor {
    
    let attribute: NSLayoutConstraint.Attribute
    let relation: NSLayoutConstraint.Relation
    let constant: CGFloat
    let multiplier: CGFloat
    
    init(_ attribute: NSLayoutConstraint.Attribute,
         _ relation: NSLayoutConstraint.Relation,
         _ constant: CGFloat = 0,
         _ multiplier: CGFloat = 1) {
        
        self.attribute = attribute
        self.relation = relation
        self.constant = constant
        self.multiplier = multiplier
    }
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

