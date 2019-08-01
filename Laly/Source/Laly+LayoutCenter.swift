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
    func center(to superView: Constraintable, on type: LayoutConstantCenter) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type, of: superView)
    }
    
    @discardableResult
    func center(to superView: Constraintable, on type: LayoutCenter) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type, of: superView)
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


public enum LayoutConstantCenter: Hashable, Duplicatable, AtributoRelationable {
    case x(_ constant: CGFloat = 0)
    case y(_ constant: CGFloat = 0)
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .x:
            return NSLayoutConstraint.Attribute.centerX
        case .y:
            return NSLayoutConstraint.Attribute.centerY
        }
    }
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .x(let c):
            return LalyRelationer(.centerX, .equal, const: c)
        case .y(let c):
            return LalyRelationer(.centerY, .equal, const: c)
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

public enum LayoutCenter: Hashable, Duplicatable, AtributoRelationable {
    case x
    case y
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .x:
            return NSLayoutConstraint.Attribute.centerX
        case .y:
            return NSLayoutConstraint.Attribute.centerY
        }
    }
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .x:
            return LalyRelationer(.centerX, .equal)
        case .y:
            return LalyRelationer(.centerY, .equal)
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
