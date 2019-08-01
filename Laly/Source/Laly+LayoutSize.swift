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
        constraintBasedOnLayoutType(type: type)
    }
    
    //prediction.laly.size(.height(10))
    @discardableResult
    func size(_ type: LayoutConstantSize) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type)
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
        constraintBasedOnLayoutType(type: type, of: superView)
    }
    
    //prediction.laly.size(of: imageView, relation: (.height, to: .width))
    @discardableResult
    func size(of superView: Constraintable, relation type: (LayoutSize, to: LayoutSize)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type.0, toType: type.to, of: superView)
    }
    
    //prediction.laly.size(of: imageView, relation: (.height, to: .height(10)))
    //prediction.laly.size(of: imageView, relation: (.height, to: .heightMuliply(10)))
    @discardableResult
    func size(of superView: Constraintable, relation type: (LayoutSize, to: DetailedLayoutSize)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type.0, toType: type.to, of: superView)
    }
    
    //prediction.laly.size(of: imageview, relation: (.height, to: .height(>=10)))
    //prediction.laly.size(of: imageview, relation: (.height, to: .heightMultiply(>=10)))
    @discardableResult
    func size(of superView: Constraintable, relation type: (LayoutSize, to: DetailedOperationLayoutSize)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type.0, toType: type.to, of: superView)
    }
    
    //prediction.laly.size(of: imageView, relations: (.height, to: height(10)), (.width, to: .width(15)))
    @discardableResult
    func size(of superView: Constraintable, relations layoutRelations: (LayoutSize, to: DetailedLayoutSize)...) -> [NSLayoutConstraint] {
        return layoutRelations.map { size(of: superView, relation: ($0.0, to: $0.to)) }
    }
    
    //prediction.laly.size(to: imageView)
    @discardableResult
    func size(of superView: Constraintable) -> [NSLayoutConstraint] {
        size(of: superView, relations: (.width, to: .widthBy(0)), (.height, to: .heightBy(0)))
    }
    
    //prediction.laly.sizes(of: imageView, relations: (.height, to: height(>=10)), (.width, to: .width(<=15)))
    @discardableResult
    func size(of superView: Constraintable, relations layoutRelations: (LayoutSize, to: DetailedOperationLayoutSize)...) -> [NSLayoutConstraint] {
        return layoutRelations.map { size(of: superView, relation: ($0.0, to: $0.to)) }
    }
}

public enum LayoutOperationSize: Hashable, Duplicatable, AtributoRelationable {
    case height(_ margin: LalyMargin)
    case width(_ margin: LalyMargin)
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .height:
            return .height
        case .width:
            return .width
        }
    }
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .height(let c), .width(let c):
            return LalyRelationer(.notAnAttribute, c.relation, const: c.points)
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

public enum LayoutConstantSize: Hashable, Duplicatable, AtributoRelationable {
    case height(_ constant: CGFloat)
    case width(_ constant: CGFloat)
    
    private var rawValue: Int {
        switch self {
        case .height:
            return 0
        case .width:
            return 1
        }
    }
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .height:
            return .height
        case .width:
            return .width
        }
    }
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .height(let c), .width(let c):
            return LalyRelationer(.notAnAttribute, .equal, const: c)
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

public enum DetailedLayoutSize: Relationable {
    case widthBy(_ constant: CGFloat = 0)
    case heightBy(_ constant: CGFloat = 0)
    case widthMultiply(_ value: CGFloat)
    case heightMultiply(_ value: CGFloat)
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .heightBy(let c):
            return LalyRelationer(.height, .equal, const: c)
        case .heightMultiply(let c):
            return LalyRelationer(.height, .equal, multiply: c)
        case .widthBy(let c):
            return LalyRelationer(.width, .equal, const: c)
        case .widthMultiply(let c):
            return LalyRelationer(.width, .equal, multiply: c)
        }
    }
}

public enum DetailedOperationLayoutSize: Relationable {
    case width(_ margin: LalyMargin)
    case height(_ margin: LalyMargin)
    case widthMultiply(_ margin: LalyMargin)
    case heightMultiply(_ margin: LalyMargin)
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .height(let c):
            return LalyRelationer(.height, c.relation, const: c.points)
            
        case .heightMultiply(let c):
            return LalyRelationer(.height, c.relation, multiply: c.points)
            
        case .width(let c):
            return LalyRelationer(.width, c.relation, const: c.points)
            
        case .widthMultiply(let c):
            return LalyRelationer(.width, c.relation, multiply: c.points)
        }
    }
}

public enum LayoutSize: Hashable, Duplicatable, AtributoRelationable{
    case width
    case height
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .height:
            return .height
        case .width:
            return .width
        }
    }
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .height:
            return LalyRelationer(.height, .equal)
        case .width:
            return LalyRelationer(.width, .equal)
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



