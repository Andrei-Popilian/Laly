//
//  ConstraintLalyLayout+LayoutDimension.swift
//  Laly
//
//  Created by Andrei Popilian on 7/18/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public extension LalyLayout  {
    
    //prediction.laly.size(.height(>=10))
    @discardableResult
    func size(_ type: LayoutOperationSize) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutOperationSize.attributeFor(type)
        let attributor = LayoutOperationSize.atributorFor(type)
        
        return constraintWithAttributor(attributor, selfAttribute)
    }
    
    //prediction.laly.size(.height(10))
    @discardableResult
    func size(_ type: LayoutConstantSize) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutConstantSize.attributeFor(type)
        let attributor = LayoutConstantSize.atributorFor(type)
        
        return constraintWithAttributor(attributor, selfAttribute)
    }
    
    //prediction.laly.size(.height(>=10), .width(>=10))
    @discardableResult
    func size(_ dimensionTypes: LayoutOperationSize...) -> [NSLayoutConstraint] {
        
        dimensionTypes.checkForDuplicates()
        return dimensionTypes.map { size($0) }
    }
    
    //prediction.laly.size(.height(10), .width(10))
    @discardableResult
    func size(_ dimensionTypes: LayoutConstantSize...) -> [NSLayoutConstraint] {
        
        dimensionTypes.checkForDuplicates()
        return dimensionTypes.map { size($0) }
    }
    
    //prediction.laly.size(of: imageView, on: .width)
    @discardableResult
    func size(of superView: Constraintable, on type: LayoutSize) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutSize.attributeFor(type)
        let attributor = LayoutSize.atributorFor(type)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.size(of: imageView, relation: (.height, to: .width))
    @discardableResult
    func size(of superView: Constraintable, relation type: (LayoutSize, to: LayoutSize)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutSize.attributeFor(type.0)
        let attributor = LayoutSize.atributorFor(type.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.size(of: imageView, relation: (.height, to: .height(10)))
    //prediction.laly.size(of: imageView, relation: (.height, to: .heightMuliply(10)))
    @discardableResult
    func size(of superView: Constraintable, relation type: (LayoutSize, to: DetailedLayoutSize)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutSize.attributeFor(type.0)
        let attributor = DetailedLayoutSize.atributorFor(type.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.size(of: imageview, relation: (.height, to: .height(>=10)))
    //prediction.laly.size(of: imageview, relation: (.height, to: .heightMultiply(>=10)))
    @discardableResult
    func size(of superView: Constraintable, relation type: (LayoutSize, to: DetailedOperationLayoutSize)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutSize.attributeFor(type.0)
        let attributor = DetailedOperationLayoutSize.atributorFor(type.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.size(of: imageView, relations: (.height, to: height(10)), (.width, to: .width(15)))
    @discardableResult
    func size(of superView: Constraintable, relations layoutRelations: (LayoutSize, to: DetailedLayoutSize)...) -> [NSLayoutConstraint] {
        
        return layoutRelations.map { size(of: superView, relation: ($0.0, to: $0.to)) }
    }
    
    //prediction.laly.size(to: imageView)
    @discardableResult
    func size(of superView: Constraintable) -> [NSLayoutConstraint] {
        
        return size(of: superView, relations: (.width, to: .widthBy(0)), (.height, to: .heightBy(0)))
    }
    
    //prediction.laly.sizes(of: imageView, relations: (.height, to: height(>=10)), (.width, to: .width(<=15)))
    @discardableResult
    func size(of superView: Constraintable, relations layoutRelations: (LayoutSize, to: DetailedOperationLayoutSize)...) -> [NSLayoutConstraint] {

        return layoutRelations.map { size(of: superView, relation: ($0.0, to: $0.to)) }
    }
}

public enum LayoutOperationSize: Hashable, Duplicatable {
    
    case height(_ margin: LalyMargin)
    case width(_ margin: LalyMargin)
    
    static func attributeFor(_ type: LayoutOperationSize) -> NSLayoutConstraint.Attribute {
        switch type {
        case .height:
            return .height
        case .width:
            return .width
        }
    }
    
    static func atributorFor(_ type: LayoutOperationSize) -> LalyLayoutAttributor {
        switch type {
        case .height(let c), .width(let c):
            return LalyLayoutAttributor(.notAnAttribute, c.relation, const: c.points)
        }
    }
    
    private var rawValue: Int {
        switch self {
        case .height:
            return 0
        case .width:
            return 1
        }
    }
    
    public static func == (lhs: LayoutOperationSize, rhs: LayoutOperationSize) -> Bool {
        switch (lhs, rhs) {
        case (.height, .height),
             (.width, .width):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum LayoutConstantSize: Hashable, Duplicatable {
    
    case height(_ constant: CGFloat)
    case width(_ constant: CGFloat)
    
    static func attributeFor(_ type: LayoutConstantSize) -> NSLayoutConstraint.Attribute {
        switch type {
        case .height:
            return .height
        case .width:
            return .width
        }
    }
    
    static func atributorFor(_ type: LayoutConstantSize) -> LalyLayoutAttributor {
        switch type {
        case .height(let c), .width(let c):
            return LalyLayoutAttributor(.notAnAttribute, .equal, const: c)
        }
    }
    
    private var rawValue: Int {
        switch self {
        case .height:
            return 0
        case .width:
            return 1
        }
    }
    
    public static func == (lhs: LayoutConstantSize, rhs: LayoutConstantSize) -> Bool {
        switch (lhs, rhs) {
        case (.height, .height),
             (.width, .width):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum DetailedLayoutSize {
    case widthBy(_ constant: CGFloat = 0)
    case heightBy(_ constant: CGFloat = 0)
    case widthMultiply(_ value: CGFloat)
    case heightMultiply(_ value: CGFloat)
    
    static func atributorFor(_ type: DetailedLayoutSize) -> LalyLayoutAttributor {
        switch type {
        case .heightBy(let c):
            return LalyLayoutAttributor(.height, .equal, const: c)
        case .heightMultiply(let c):
            return LalyLayoutAttributor(.height, .equal, multiply: c)
        case .widthBy(let c):
            return LalyLayoutAttributor(.width, .equal, const: c)
        case .widthMultiply(let c):
            return LalyLayoutAttributor(.width, .equal, multiply: c)
        }
    }
}

public enum DetailedOperationLayoutSize {
    case width(_ margin: LalyMargin)
    case height(_ margin: LalyMargin)
    case widthMultiply(_ margin: LalyMargin)
    case heightMultiply(_ margin: LalyMargin)
    
    static func atributorFor(_ type: DetailedOperationLayoutSize) -> LalyLayoutAttributor {
        switch type {
        case .height(let c):
            return LalyLayoutAttributor(.height, c.relation, const: c.points)
            
        case .heightMultiply(let c):
            return LalyLayoutAttributor(.height, c.relation, multiply: c.points)
            
        case .width(let c):
            return LalyLayoutAttributor(.width, c.relation, const: c.points)
            
        case .widthMultiply(let c):
            return LalyLayoutAttributor(.width, c.relation, multiply: c.points)
        }
    }
}

public enum LayoutSize: Hashable, Duplicatable {
    case width
    case height
    
    static func attributeFor(_ type: LayoutSize) -> NSLayoutConstraint.Attribute {
        switch type {
        case .height:
            return .height
        case .width:
            return .width
        }
    }
    
    static func atributorFor(_ type: LayoutSize) -> LalyLayoutAttributor {
        switch type {
        case .height:
            return LalyLayoutAttributor(.height, .equal)
        case .width:
            return LalyLayoutAttributor(.width, .equal)
        }
    }
    
    private var rawValue: Int {
        switch self {
        case .width:
            return 0
        case .height:
            return 1
        }
    }
    
    public static func == (lhs: LayoutSize, rhs: LayoutSize) -> Bool {
        switch (lhs, rhs) {
        case (.width, .width),
             (.height, .height):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}



