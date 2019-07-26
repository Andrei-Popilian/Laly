//
//  ConstraintLalyLayout+LayoutCenter.swift
//  Laly
//
//  Created by Andrei Popilian on 7/18/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public extension LalyLayout  {
    
    @discardableResult
    func center(to superView: Constraintable, on centerType: LayoutConstantCenter) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutConstantCenter.attributeFor(centerType)
        let attributor = LayoutConstantCenter.atributorFor(centerType)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    @discardableResult
    func center(to superView: Constraintable, on centerType: LayoutCenter) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutCenter.attributeFor(centerType)
        let attributor = LayoutCenter.atributorFor(centerType)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    @discardableResult
    func center(to superView: Constraintable, on types: LayoutCenter...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { center(to: superView ,on: $0) }
    }
    
    @discardableResult
    func center(to superView: Constraintable, on types: LayoutConstantCenter...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { center(to: superView ,on: $0) }
    }
    
}


public enum LayoutConstantCenter: Hashable, Duplicatable {
    
    case x(_ constant: CGFloat = 0)
    case y(_ constant: CGFloat = 0)
    
    static func attributeFor(_ type: LayoutConstantCenter) -> NSLayoutConstraint.Attribute {
        switch type {
        case .x:
            return NSLayoutConstraint.Attribute.centerX
        case .y:
            return NSLayoutConstraint.Attribute.centerY
        }
    }
    
    static func atributorFor(_ type: LayoutConstantCenter) -> LalyLayoutAttributor {
        switch type {
        case .x(let c):
            return LalyLayoutAttributor(.centerX, .equal, const: c)
        case .y(let c):
            return LalyLayoutAttributor(.centerY, .equal, const: c)
        }
    }
    
    private var rawValue: Int {
        switch self {
        case .x:
            return 0
        case .y:
            return 1
        }
    }
    
    public static func == (lhs: LayoutConstantCenter, rhs: LayoutConstantCenter) -> Bool {
        switch (lhs, rhs) {
        case (.x, .x),
             (.y, .y):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum LayoutCenter: Hashable, Duplicatable {
    case x
    case y
    
    static func attributeFor(_ type: LayoutCenter) -> NSLayoutConstraint.Attribute {
        switch type {
        case .x:
            return NSLayoutConstraint.Attribute.centerX
        case .y:
            return NSLayoutConstraint.Attribute.centerY
        }
    }
    
    static func atributorFor(_ type: LayoutCenter) -> LalyLayoutAttributor {
        switch type {
        case .x:
            return LalyLayoutAttributor(.centerX, .equal)
        case .y:
            return LalyLayoutAttributor(.centerY, .equal)
        }
    }
    
    private var rawValue: Int {
        switch self {
        case .x:
            return 0
        case .y:
            return 1
        }
    }
    
    public static func == (lhs: LayoutCenter, rhs: LayoutCenter) -> Bool {
        switch (lhs, rhs) {
        case (.x, .x),
             (.y, .y):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}
