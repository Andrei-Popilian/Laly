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
    func center(to superView: Constraintable, on centerType: LayoutCenter) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutCenter.attributeFor(centerType)
        let attributor = LayoutCenter.atributorFor(centerType)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    @discardableResult
    func center(to superView: Constraintable, on centerType: SimpleLayoutCenter) -> NSLayoutConstraint {
        
        let selfAttribute = SimpleLayoutCenter.attributeFor(centerType)
        let attributor = SimpleLayoutCenter.atributorFor(centerType)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    @discardableResult
    func center(to superView: Constraintable, on types: SimpleLayoutCenter...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { center(to: superView ,on: $0) }
    }
    
    @discardableResult
    func center(to superView: Constraintable, on types: LayoutCenter...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { center(to: superView ,on: $0) }
    }
    
}


public enum LayoutCenter: Hashable, Duplicatable {
    
    case x(_ constant: CGFloat = 0)
    case y(_ constant: CGFloat = 0)
    
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
        case .x(let const):
            return LalyLayoutAttributor(.centerX, .equal, const)
        case .y(let const):
            return LalyLayoutAttributor(.centerY, .equal, const)
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

public enum SimpleLayoutCenter: Hashable, Duplicatable {
    case x
    case y
    
    static func attributeFor(_ type: SimpleLayoutCenter) -> NSLayoutConstraint.Attribute {
        switch type {
        case .x:
            return NSLayoutConstraint.Attribute.centerX
        case .y:
            return NSLayoutConstraint.Attribute.centerY
        }
    }
    
    static func atributorFor(_ type: SimpleLayoutCenter) -> LalyLayoutAttributor {
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
    
    public static func == (lhs: SimpleLayoutCenter, rhs: SimpleLayoutCenter) -> Bool {
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
