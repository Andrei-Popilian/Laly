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
    
    internal func constraintWithAttributor(_ attributor: LalyRelationer, _ selfAttribute: NSLayoutConstraint.Attribute, _ relationView: Constraintable? = nil) -> NSLayoutConstraint {
        
        NSLayoutConstraint(item: layout, attribute: selfAttribute, relatedBy: attributor.relation, toItem: relationView, attribute: attributor.attribute, multiplier: attributor.multiplier, constant: attributor.constant)
            .activated()
    }
}

public struct LalyMargin {
    
    var points: CGFloat
    var relation: NSLayoutConstraint.Relation
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

public struct LalyRelationer {
    
    let attribute: NSLayoutConstraint.Attribute
    let relation: NSLayoutConstraint.Relation
    let constant: CGFloat
    let multiplier: CGFloat
    
    init(_ attribute: NSLayoutConstraint.Attribute,
         _ relation: NSLayoutConstraint.Relation,
         const constant: CGFloat = 0,
         multiply multiplier: CGFloat = 1) {
        
        self.attribute = attribute
        self.relation = relation
        self.constant = constant
        self.multiplier = multiplier
    }
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

public protocol Duplicatable {}

typealias AtributoRelationable = Attributable & Relationable

protocol Attributable {
    func getAttribute() -> NSLayoutConstraint.Attribute
}

protocol Relationable {
    func getAttributor() -> LalyRelationer
}

internal extension LalyLayout {
    
    func constraintBasedOnLayoutType(type: AtributoRelationable) -> NSLayoutConstraint {
        
        let selfAttribute = type.getAttribute()
        let attributor = type.getAttributor()
        
        return constraintWithAttributor(attributor, selfAttribute)
    }
    
    func constraintBasedOnLayoutType(type: AtributoRelationable, of relationView: Constraintable) -> NSLayoutConstraint {
        
        let selfAttribute = type.getAttribute()
        let attributor = type.getAttributor()
        
        return constraintWithAttributor(attributor, selfAttribute, relationView)
    }
    
    func constraintBasedOnLayoutType(type: Attributable, toType: Relationable, of relationView: Constraintable) -> NSLayoutConstraint {
        
        let selfAttribute = type.getAttribute()
        let attributor = toType.getAttributor()
        
        return constraintWithAttributor(attributor, selfAttribute, relationView)
    }
    
}


extension Array where Element: Hashable, Element: Duplicatable {
    
    public func checkForDuplicates() {
        
        if containDuplicates() {
            fatalError("Error: Your constraints: \(self) contains duplicates !!!")
        }
    }
    
    func containDuplicates() -> Bool {
        
        var dict = [Element: Bool]()
        for e in self {
            guard dict.updateValue(true, forKey: e) == nil else {
                return true
            }
        }
        
        return false
    }
}

