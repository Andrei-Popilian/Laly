//
//  ConstraintLalyLayout+LayoutDimension.swift
//  Laly
//
//  Created by Andrei Popilian on 7/18/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public extension LalyLayout  {
    
    /**
     Used to create a size constraint to self with a variable size
     Usage e.g: "someView.laly.size(.width(>=200))"
     
     - Parameters:
        - type: The size type and a constant addition operation like:  ">=Value" or "<=Value"
     
     - Returns: An activated size to self constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(_ type: LayoutOperationSize) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type)
    }
    
    /**
     Used to create a size constraint to self with a constant size
     Usage e.g: "someView.laly.size(.width(200))"
     
     - Parameters:
        - type: The size type and a constant addition
     
     - Returns: An activated size to self constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(_ type: LayoutConstantSize) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type)
    }
    
    /**
     Used to create multiple size constraints to self with variable sizes
     Usage e.g: "someView.laly.size(.height(>=10), .width(<=10))"
     
     - Parameters:
        - types: The size types enumerated having a constant addition operation like: ">=Value" or "<=Value"
     
     - Returns: A list of activated sizes to self constraints
     - Note: Use "deactivated()" function if the list of constraints is required to be deactivated
     */
    @discardableResult
    func size(_ types: LayoutOperationSize...) -> [NSLayoutConstraint] {
        types.checkForDuplicates()
        return types.map { size($0) }
    }
    
    /**
     Used to create multiple size constraints to self
     Usage e.g: "someView.laly.size(.height(10),  .width(10))"
     
     - Parameters:
        - types: The size types enumerated having a constant addition
     
     - Returns: A list of activated sizes to self constraints
     - Note: Use "deactivated()" function if the list of constraints is required to be deactivated
     */    @discardableResult
    func size(_ types: LayoutConstantSize...) -> [NSLayoutConstraint] {
        types.checkForDuplicates()
        return types.map { size($0) }
    }
    
    /**
     Used to create a size constraint equal the same size of another UIComponent
     Usage e.g: "someView.laly.size(of: imageView, on: .width)"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - type: The size type
     
     - Returns: An activated size to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(of relationView: Constraintable, on type: LayoutSize) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type, of: relationView)
    }
    
    /**
     Used to create a size constraint equal the another size type of other UIComponent
     Usage e.g: "someView.laly.size(of: imageView, relation: (.height, to: .width))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relation: The relation between UIComponents e.g  (.height to: .width), being read as my height is equal to other UIComponent's width
     
     - Returns: An activated size to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(of relationView: Constraintable, relation type: (LayoutSize, to: LayoutSize)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type.0, toType: type.to, of: relationView)
    }
    
    /**
     Used to create a size constraint equal the another size type of other UIComponent + additionl constant or multiplier
     Usage e.g: "someView.laly.size(of: imageView, relation: (.height, to: .heightBy(10)))"
     Usage e.g: "someView.laly.size(of: imageView, relation: (.height, to: .heightMuliply(10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relation: The relation between UIComponents e.g  (.height to: .widthBy(10)), being read as my height is equal to width + 10 pixels of other UIComponent
     
     - Returns: An activated size to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(of relationView: Constraintable, relation type: (LayoutSize, to: DetailedLayoutSize)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type.0, toType: type.to, of: relationView)
    }
    
    /**
     Used to create a size constraint equal the another size type of other UIComponent + additional constant or multiplier with operations
     Usage e.g: "someView.laly.size(of: imageView, relation: (.height, to: .height(>=10)))"
     Usage e.g: "someView.laly.size(of: imageView, relation: (.width, to: .heightMuliply(<=10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relation: The relation between UIComponents e.g  (.height to: .width(>=10)), being read as my height is greaterOrEqual to width + 10 pixels of other UIComponent
     
     - Returns: An activated size to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(of relationView: Constraintable, relation type: (LayoutSize, to: DetailedOperationLayoutSize)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type.0, toType: type.to, of: relationView)
    }
    
    /**
     Used to create  multiple constraints equal the another size type of other UIComponent + additional constant or multiplier
     Usage e.g: "someView.laly.size(of: imageView, relations: (.height, to: height(10)), (.width, to: .width(15)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relations: multiple enumerated relations between UIComponents, e.g  (.height, to: height(10)), (.width, to: .width(15))),  being read as my height is equal to height + 10 pixels of other UIComponent and my width is equal to width + 15 or other
     
     - Returns: An activated list of size to another UIComponent constraints
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(of relationView: Constraintable, relations layoutRelations: (LayoutSize, to: DetailedLayoutSize)...) -> [NSLayoutConstraint] {
        return layoutRelations.map { size(of: relationView, relation: ($0.0, to: $0.to)) }
    }
    
    /**
     Used to create multiple constraints in order to have the same size as relationView UIComponent
     Usage e.g: "someView.laly.size(to: imageView)
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
     
     - Returns: An activated list of constraints to relationView UIComponent
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(of relationView: Constraintable) -> [NSLayoutConstraint] {
        size(of: relationView, relations: (.width, to: .widthBy(0)), (.height, to: .heightBy(0)))
    }
    
    //prediction.laly.sizes(of: imageView, relations: (.height, to: height(>=10)), (.width, to: .width(<=15)))
    /**
     Used to create  multiple constraints equal the another size type of other UIComponent + additional constant or multiplier with operations
     Usage e.g: "someView.laly.size(of: imageView, relations: (.height, to: height(>=10)), (.width, to: .width(<=15)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relations: multiple enumerated relations between UIComponents, e.g  (.height, to: height(>=10)), (.width, to: .width(<=15))),  being read as my height is greaterThanOrEqual to height + 10 pixels of other UIComponent and my width is lessThanOrEqual to width + 15 or other
     
     - Returns: An activated list of size to another UIComponent constraints
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func size(of relationView: Constraintable, relations layoutRelations: (LayoutSize, to: DetailedOperationLayoutSize)...) -> [NSLayoutConstraint] {
        return layoutRelations.map { size(of: relationView, relation: ($0.0, to: $0.to)) }
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



