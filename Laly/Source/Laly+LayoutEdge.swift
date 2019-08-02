//
//  ConstraintLalyLayout+LayoutEdge.swift
//  Laly
//
//  Created by Andrei Popilian on 7/18/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public extension LalyLayout  {
    
    /**
     Used to create an edge constraint equal the same edge of other UIComponent
     Usage e.g: "someView.laly.edge(to: relationView, of: .botBy(10))"
     Usage e.g: "someView.laly.edge(to: relationView, of: .bot)"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - type: The edge type
     
     - Returns: An activated edge to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edge(to relationView: Constraintable, of type: ConstraintType) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type, of: relationView)
    }
    
    /**
     Used to create a list of edge constraints equal the same edges of other UIComponent
     Usage e.g: "someView.laly.edges(to: imageView: of: .leadBy(10), .trail)"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - types: The edge types enumerated
     
     - Returns: An activated edge to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     - Warning: Adding duplicated types will result in to a fatal error specifying the duplication
     */
    @discardableResult
    func edges(to relationView: Constraintable, of types: ConstraintType...) -> [NSLayoutConstraint] {
        types.checkForDuplicates()
        return types.map { edge(to: relationView, of: $0) }
    }
    
    /**
     Used to create an edge constraint equal the same edge of other UIComponent by operation
     Usage e.g: "someView.laly.edges(to: imageView: of: .bot(>=10))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - type: The edge type
     
     - Returns: An activated edge to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edge(to relationView: Constraintable, of type: ConstraintOperationType) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: type, of: relationView)
    }
    
    /**
     Used to create a list of edge constraints equal the same edges of other UIComponent operations
     Usage e.g: "someView.laly.edgesTo(imageView: of: .lead(>=10), .trail())"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - types: The edge types enumerated e.g .eedgesTo(imageView: of: .lead(>=10), .trail()), is being read as myView's lead is greaterThanOrEqual to imageView's lead + 10 and myView's trail is equal to imageView's trail
     
     - Returns: An activated list of edge constraints to another UIComponent
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     - Warning: Adding duplicated types will result in to a fatal error specifying the duplication
     */
    @discardableResult
    func edges(to relationView: Constraintable, of types: ConstraintOperationType...) -> [NSLayoutConstraint] {
        types.checkForDuplicates()
        return types.map { edge(to: relationView, of: $0) }
    }
    
    /**
     Used to create a list of edge constraints equal the same edges of other UIComponent  plus an optional identation
     Usage e.g: "someView.laly.edges(to: imageView, ofIdentation: 10)"
     Usage e.g: "someView.laly.edges(to: imageView)"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - ofIdentation: by default is 0, the indentation ammount for each edge (4 edges), will be calculated as follows: top + ide, bot - ide, lead + ide, trail - ide
     
     - Returns: An activated list of edge constraints to another UIComponent
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     - Warning: Adding duplicated types will result in to a fatal error specifying the duplication
     */
    @discardableResult
    func edges(to relationView: Constraintable, ofIdentation const: CGFloat = 0) -> [NSLayoutConstraint] {
        edges(to: relationView, of: .leadBy(const), .trailBy(-const), .botBy(-const), .topBy(const))
    }
    
    /**
     Used to create an edge constraint equal the another edge type of other UIComponent + additional constant
     Usage e.g: "someView.laly.edge(to: photoImageView, relation: (.top, to: .botBy(10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relation: The relation between UIComponents e.g  (.top to: .botBy(10)), being read as my top is equal to bot + 10 pixels of other UIComponent
     
     - Returns: An activated edge to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edge(to relationView: Constraintable, relation: (LayoutYAxisAnchor, to: LayoutYAxis)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: relation.0, toType: relation.to, of: relationView)
    }
    
    /**
     Used to create a list of edge constraints equal the another edge type of other UIComponent + additional constant
     Usage e.g: "someView.laly.edge(to: photoImageView, relations: (.top, to: .topBy(-10)), (.bot, to: botBy(-10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relations: The relations between UIComponents e.g  (.top, to: .topBy(-10)), (.bot, to: botBy(-10))), being read as my top is equal to top - 10 pixels of other UIComponent and my bot is equal to bot - 10 pixels of other UIComponent
     
     - Returns: An activated list of edge constraints to another UIComponent
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edges(to relationView: Constraintable, relations: (LayoutYAxisAnchor, to: LayoutYAxis)...) -> [NSLayoutConstraint] {
        return relations.map { edge(to: relationView, relation: ($0.0, to: $0.to)) }
    }
    
    /**
     Used to create an edge constraint equal the another edge type of other UIComponent + additional constant operations
     Usage e.g: "someView.laly.edge(to: photoImageView, relation: (.top, to: .botBy(<=10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relation: The relation between UIComponents e.g  (.top to: .botBy(10)), being read as my top is lessThanOrEqual to bot + 10 pixels of other UIComponent
     
     - Returns: An activated edge to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edge(to relationView: Constraintable, relation: (LayoutYAxisAnchor, to: LayoutYOperationAxis)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: relation.0, toType: relation.to, of: relationView)
    }
    
    /**
     Used to create a list of edge constraints equal the another edge type of other UIComponent + additional constant operations
     Usage e.g: "someView.laly.edge(to: photoImageView, relations: (.top, to: .topBy(-10)), (.bot, to: botBy(-10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relations: The relations between UIComponents e.g  (.top, to: .topBy(<=10)), (.bot, to: botBy(>=10))), being read as my top is lessThanOrEqual to top + 10 pixels of other UIComponent and my bot is greaterThanOrEqual to bot + 10 pixels of other UIComponent
     
     - Returns: An activated list of edge constraints to another UIComponent
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edges(to relationView: Constraintable, relations: (LayoutYAxisAnchor, to: LayoutYOperationAxis)...) -> [NSLayoutConstraint]  {
        return relations.map { edge(to: relationView, relation: ($0.0, to: $0.1)) }
    }
    
    /**
     Used to create an edge constraint equal the another edge type of other UIComponent + additional constant
     Usage e.g: "someView.laly.edge(to: photoImageView, relation: (.lead, to: .leadBy(10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relation: The relation between UIComponents e.g  (.lead to: .leadBy(10)), being read as my lead is equal to lead + 10 pixels of other UIComponent
     
     - Returns: An activated edge to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edge(to relationView: Constraintable, relation: (LayoutXAxisAnchor, to: LayoutXAxis)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: relation.0, toType: relation.to, of: relationView)
    }
    
    /**
     Used to create a list of edge constraints equal the another edge type of other UIComponent + additional constant
     Usage e.g: "someView.laly.edge(to: photoImageView, relations: (.lead, to: .leadBy(10)), (.trail, to: trailBy(-10)))"

     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relations: The relations between UIComponents e.g   (.lead, to: .leadBy(10)), (.trail, to: trailBy(-10)))" being read as my lead is equal to lead + 10 pixels of other UIComponent and my trail is equal to trail - 10 pixels of other UIComponent

     - Returns: An activated list of edge constraints to another UIComponent
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edges(to relationView: Constraintable, relations: (LayoutXAxisAnchor, to: LayoutXAxis)...) -> [NSLayoutConstraint] {
        return relations.map { edge(to: relationView, relation: ($0.0, to: $0.1)) }
    }
    
    /**
     Used to create an edge constraint equal the another edge type of other UIComponent + additional constant operation
     Usage e.g: "someView.laly.edge(to: photoImageView, relation: (.lead, to: .leadBy(>=10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relation: The relation between UIComponents e.g  (.lead to: .leadBy(>=10)), being read as my lead is greaterThanOrEqual to lead + 10 pixels of other UIComponent
     
     - Returns: An activated edge to another UIComponent constraint
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edge(to relationView: Constraintable, relation: (LayoutXAxisAnchor, to: LayoutXOperationAxis)) -> NSLayoutConstraint {
        constraintBasedOnLayoutType(type: relation.0, toType: relation.to, of: relationView)
    }
    
    /**
     Used to create a list of edge constraints equal the another edge type of other UIComponent + additional constant operations
     Usage e.g: "someView.laly.edge(to: photoImageView, relations: (.lead, to: .leadBy(>=10)), (.trail, to: trailBy(-10)))"
     
     - Parameters:
        - relationView: A UIView or UILayoutGuide component used as a constraint relation
        - relations: The relations between UIComponents e.g   (.lead, to: .leadBy(>=10)), (.trail, to: trailBy(-10)))" being read as my lead is greaterThanOrEqual to lead + 10 pixels of other UIComponent and my trail is equal to trail - 10 pixels of other UIComponent
     
     - Returns: An activated list of edge constraints to another UIComponent
     - Note: Use "deactivated()" function if the constraint is required to be deactivated
     */
    @discardableResult
    func edges(to relationView: Constraintable, relations: (LayoutXAxisAnchor, to: LayoutXOperationAxis)...) -> [NSLayoutConstraint] {
        return relations.map { edge(to: relationView, relation: ($0.0, to: $0.1)) }
    }
}

public enum LayoutYAxisAnchor: Attributable {
    case top
    case bot
    case centerY
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .top:
            return .top
        case .bot:
            return .bottom
        case .centerY:
            return .centerY
        }
    }
}

public enum LayoutYAxis: Relationable {
    case topBy(_ constant: CGFloat = 0)
    case botBy(_ constant: CGFloat = 0)
    case centerYBy(_ constant: CGFloat = 0)
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .topBy(let c):
            return LalyRelationer(.top, .equal, const: c)
        case .botBy(let c):
            return LalyRelationer(.bottom, .equal, const: c)
        case .centerYBy(let c):
            return LalyRelationer(.centerY, .equal, const: c)
        }
    }
}

public enum LayoutYOperationAxis: Relationable {
    case topBy(_ margin: LalyMargin)
    case botBy(_ margin: LalyMargin)
    case centerYBy(_ margin: LalyMargin)
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .topBy(let c):
            return LalyRelationer(.top, c.relation, const: c.points)
        case .botBy(let c):
            return LalyRelationer(.bottom, c.relation, const: c.points)
        case .centerYBy(let c):
            return LalyRelationer(.centerY, c.relation, const: c.points)
        }
    }
}

public enum LayoutXAxisAnchor: Attributable {
    case lead
    case trail
    case centerX
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .lead:
            return .leading
        case .trail:
            return .trailing
        case .centerX:
            return .centerX
        }
    }
}

public enum LayoutXAxis: Relationable {
    case leadBy(_ constant: CGFloat = 0)
    case trailBy(_ constant: CGFloat = 0)
    case centerXBy(_ constant: CGFloat = 0)
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .leadBy(let c):
            return LalyRelationer(.leading, .equal, const: c)
        case .trailBy(let c):
            return LalyRelationer(.trailing, .equal, const: c)
        case .centerXBy(let c):
            return LalyRelationer(.centerX, .equal, const: c)
        }
    }
}

public enum LayoutXOperationAxis: Relationable {
    case leadBy(_ margin: LalyMargin)
    case trailBy(_ margin: LalyMargin)
    case centerXBy(_ margin: LalyMargin)
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .leadBy(let c):
            return LalyRelationer(.leading, c.relation, const: c.points)
        case .trailBy(let c):
            return LalyRelationer(.trailing, c.relation, const: c.points)
        case .centerXBy(let c):
            return LalyRelationer(.centerX, c.relation, const: c.points)
        }
    }
}

public enum ConstraintType: Duplicatable, Hashable, AtributoRelationable  {
    case top
    case bot
    case lead
    case trail
    case width
    case height
    case topBy(_ value: CGFloat)
    case botBy(_ value: CGFloat)
    case leadBy(_ value: CGFloat)
    case trailBy(_ value: CGFloat)
    case widthBy(_ value: CGFloat)
    case heightBy(_ value: CGFloat)
    case topMultiply(_ value: CGFloat)
    case botMultiply(_ value: CGFloat)
    case leadMultiply(_ value: CGFloat)
    case trailMultiply(_ value: CGFloat)
    case widthMultiply(_ value: CGFloat)
    case heightMultiply(_ value: CGFloat)
    
    private var rawValue: Int {
        switch self {
        case .top, .topBy, .topMultiply:
            return 0
        case .bot, .botBy, .botMultiply:
            return 1
        case .lead, .leadBy, .leadMultiply:
            return 2
        case .trail, .trailBy, .trailMultiply:
            return 3
        case .width, .widthBy, .widthMultiply:
            return 4
        case .height, .heightBy, .heightMultiply:
            return 5
        }
    }
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .top, .topBy, .topMultiply:
            return .top
        case .bot, .botBy, .botMultiply:
            return .bottom
        case .height, .heightBy, .heightMultiply:
            return .height
        case .width, .widthBy, .widthMultiply:
            return .width
        case .lead, .leadBy, .leadMultiply:
            return .leading
        case .trail, .trailBy, .trailMultiply:
            return .trailing
        }
    }
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .top:
            return LalyRelationer(.top, .equal)
        case .topBy(let c):
            return LalyRelationer(.top, .equal, const: c)
        case .topMultiply(let c):
            return LalyRelationer(.top, .equal, multiply: c)
        case .bot:
            return LalyRelationer(.bottom, .equal)
        case .botBy(let c):
            return LalyRelationer(.bottom, .equal, const: c)
        case .botMultiply(let c):
            return LalyRelationer(.bottom, .equal, multiply: c)
        case .height:
            return LalyRelationer(.height, .equal)
        case .heightBy(let c):
            return LalyRelationer(.height, .equal, const: c)
        case .heightMultiply(let c):
            return LalyRelationer(.height, .equal, multiply: c)
        case .width:
            return LalyRelationer(.width, .equal)
        case .widthBy(let c):
            return LalyRelationer(.width, .equal, const: c)
        case .widthMultiply(let c):
            return LalyRelationer(.width, .equal, multiply: c)
        case .lead:
            return LalyRelationer(.leading, .equal)
        case .leadBy(let c):
            return LalyRelationer(.leading, .equal, const: c)
        case .leadMultiply(let c):
            return LalyRelationer(.leading, .equal, multiply: c)
        case .trail:
            return LalyRelationer(.trailing, .equal)
        case .trailBy(let c):
            return LalyRelationer(.trailing, .equal, const: c)
        case .trailMultiply(let c):
            return LalyRelationer(.trailing, .equal, multiply: c)
        }
    }
    public static func == (lhs: ConstraintType, rhs: ConstraintType) -> Bool {
        switch (lhs, rhs) {
        case (.top, .top), (.bot, .bot), (.lead, .lead), (.trail, .trail), (.width, .width), (.height, .height), (.topBy, .topBy), (.botBy, .botBy), (.leadBy, .leadBy), (.trailBy, .trailBy), (.widthBy, .widthBy), (.heightBy, .heightBy), (.top, .topBy), (.topBy, .top), (.bot, .botBy), (.botBy, .bot), (.lead, .leadBy), (.leadBy, .lead), (.trail, .trailBy), (.trailBy, .trail), (.width, .widthBy), (.widthBy, .width), (.height, .heightBy), (.heightBy, .height):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum ConstraintOperationType: Duplicatable, Hashable, AtributoRelationable {
    case top(_ margin: LalyMargin)
    case bot(_ margin: LalyMargin)
    case lead(_ margin: LalyMargin)
    case trail(_ margin: LalyMargin)
    case width(_ margin: LalyMargin)
    case height(_ margin: LalyMargin)
    case widthMultiply(_ margin: LalyMargin)
    case heightMultiply(_ margin: LalyMargin)
    
    func getAttribute() -> NSLayoutConstraint.Attribute {
        switch self {
        case .top:
            return .top
        case .bot:
            return .bottom
        case .height, .heightMultiply:
            return .height
        case .width, .widthMultiply:
            return .width
        case .lead:
            return .leading
        case .trail:
            return .trailing
        }
    }
    
    func getAttributor() -> LalyRelationer {
        switch self {
        case .top(let c):
            return LalyRelationer(.top, c.relation, const: c.points)
        case .bot(let c):
            return LalyRelationer(.bottom, c.relation, const: c.points)
        case .lead(let c):
            return LalyRelationer(.leading, c.relation, const: c.points)
        case .trail(let c):
            return LalyRelationer(.trailing, c.relation, const: c.points)
        case .height(let c):
            return LalyRelationer(.height, c.relation, const: c.points)
        case .width(let c):
            return LalyRelationer(.width, c.relation, const: c.points)
        case .heightMultiply(let c):
            return LalyRelationer(.height, c.relation, multiply: c.points)
        case .widthMultiply(let c):
            return LalyRelationer(.width, c.relation, multiply: c.points)
        }
    }
    
    private var rawValue: Int {
        switch self {
        case .top:
            return 0
        case .bot:
            return 1
        case .lead:
            return 2
        case .trail:
            return 3
        case .width, .widthMultiply:
            return 4
        case .height, .heightMultiply:
            return 5
        }
    }
    
    public static func == (lhs: ConstraintOperationType, rhs: ConstraintOperationType) -> Bool {
        switch (lhs, rhs) {
        case (.top, .top), (.bot, .bot), (.lead, .lead), (.trail, .trail), (.width, .width), (.height, .height), (.width, .widthMultiply), (.height, .heightMultiply), (.widthMultiply, .width), (.heightMultiply, .height):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

