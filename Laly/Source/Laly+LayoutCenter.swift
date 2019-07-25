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
        
        var constraint: NSLayoutConstraint
        
        switch centerType {
        case .x(let const):
            constraint = layout.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: const)
            
        case .y(let const):
            constraint = layout.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: const)
        }
        
        return constraint.activated()
    }
    
    @discardableResult
    func center(to superView: Constraintable, on centerType: SimpleLayoutCenter) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch centerType {
        case .x:
            constraint = layout.centerXAnchor.constraint(equalTo: superView.centerXAnchor)
            
        case .y:
            constraint = layout.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        }
        
        return constraint.activated()
    }
    
    @discardableResult
    func centers(to superView: Constraintable, on types: SimpleLayoutCenter...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { center(to: superView ,on: $0) }
    }
    
    @discardableResult
    func centers(to superView: Constraintable, on types: LayoutCenter...) -> [NSLayoutConstraint] {

        types.checkForDuplicates()
        return types.map { center(to: superView ,on: $0) }
    }
    
}


public enum LayoutCenter: Hashable, Duplicatable {
    
    case x(_ constant: CGFloat = 0)
    case y(_ constant: CGFloat = 0)
   
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
