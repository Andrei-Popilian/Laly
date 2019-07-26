//
//  ConstraintLalyLayout+LayoutEdge.swift
//  Laly
//
//  Created by Andrei Popilian on 7/18/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public extension LalyLayout  {
    
    //prediction.laly.edge(to: superView, of: .botBy(10))
    //prediction.laly.edge(to: superView, of: .bot)
    @discardableResult
    func edge(to superView: Constraintable, of type: ConstraintType) -> NSLayoutConstraint {
        
        let selfAttribute = ConstraintType.attributeFor(type)
        let attributor = ConstraintType.atributorFor(type)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.edgesTo(imageView: of: .lead(10), .trail())
    @discardableResult
    func edges(to superView: Constraintable, of types: ConstraintType...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { edge(to: superView, of: $0) }
    }
    
    //prediction.laly.edge(to: superView, of: .bot(>=10))
    //prediction.laly.edge(to: superView, of: .widthMultiply(<=0.2))
    @discardableResult
    func edge(to superView: Constraintable, of type: ConstraintOperationType) -> NSLayoutConstraint {
        
        let selfAttribute = ConstraintOperationType.attributeFor(type)
        let attributor = ConstraintOperationType.atributorFor(type)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.edgesTo(imageView: of: .lead(>=10), .trail())
    @discardableResult
    func edges(to superView: Constraintable, of types: ConstraintOperationType...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { edge(to: superView, of: $0) }
    }
    
    //prediction.laly.edges(to: imageView, ofIdentation: 10)
    //preddiction.laly.edges(to: imageView)
    @discardableResult
    func edges(to superView: Constraintable, ofIdentation const: CGFloat = 0) -> [NSLayoutConstraint] {
        
        return edges(to: superView, of: .leadBy(const), .trailBy(-const), .botBy(-const), .topBy(const))
    }
    
    //prediction.laly.edge(to: photoImageView, relation: (.top, to: .bot(10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutYAxisAnchor, to: LayoutYAxis)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutYAxisAnchor.attributeFor(relation.0)
        let attributor = LayoutYAxis.atributorFor(relation.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.edges(to: imageView, relations: (.top, to: .top(-10)), (.bot, to: bot(-10)))
    @discardableResult
    func edges(to superView: Constraintable, relations: (LayoutYAxisAnchor, to: LayoutYAxis)...) -> [NSLayoutConstraint] {
        
        return relations.map { edge(to: superView, relation: ($0.0, to: $0.to)) }
    }
    
    //prediction.laly.edge(to: photoImageView, relation: (.top, to: .bot(<=10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutYAxisAnchor, to: LayoutYOperationAxis)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutYAxisAnchor.attributeFor(relation.0)
        let attributor = LayoutYOperationAxis.atributorFor(relation.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.edges(to: imageView, relations: (.top, to: .top(>=-10)), (.bot, to: bot(-10)))
    @discardableResult
    func edges(to superView: Constraintable, relations: (LayoutYAxisAnchor, to: LayoutYOperationAxis)...) -> [NSLayoutConstraint] {
        
        return relations.map { edge(to: superView, relation: ($0.0, to: $0.1)) }
    }
    
    //prediction.laly.edge(to: imageView, relation: (.lead, to: lead(10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutXAxisAnchor, to: LayoutXAxis)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutXAxisAnchor.attributeFor(relation.0)
        let attributor = LayoutXAxis.atributorFor(relation.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.edges(to: imageView, relations: (.lead, to: .lead(-10)), (.trail, to: .trail(-10)))
    @discardableResult
    func edges(to superView: Constraintable, relations: (LayoutXAxisAnchor, to: LayoutXAxis)...) -> [NSLayoutConstraint] {
        
        return relations.map { edge(to: superView, relation: ($0.0, to: $0.1)) }
    }
    
    //prediction.laly.edge(to: imageView, relation: (.lead, to: lead(>=10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutXAxisAnchor, to: LayoutXOperationAxis)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutXAxisAnchor.attributeFor(relation.0)
        let attributor = LayoutXOperationAxis.atributorFor(relation.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //prediction.laly.edges(to: imageView, relations: (.lead, to: .lead(-10)), (.trail, to: .trail(>=-10)))
    @discardableResult
    func edges(to superView: Constraintable, relations: (LayoutXAxisAnchor, to: LayoutXOperationAxis)...) -> [NSLayoutConstraint] {
        
        return relations.map { edge(to: superView, relation: ($0.0, to: $0.1)) }
    }
}

public enum LayoutYAxisAnchor {
    case top
    case bot
    case centerY
    
    static func attributeFor(_ type: LayoutYAxisAnchor) -> NSLayoutConstraint.Attribute {
        switch type {
        case .top:
            return .top
        case .bot:
            return .bottom
        case .centerY:
            return .centerY
        }
    }
}

public enum LayoutYAxis {
    case topBy(_ constant: CGFloat = 0)
    case botBy(_ constant: CGFloat = 0)
    case centerYBy(_ constant: CGFloat = 0)
    
    static func atributorFor(_ type: LayoutYAxis) -> LalyLayoutAttributor {
        switch type {
        case .topBy(let c):
            return LalyLayoutAttributor(.top, .equal, const: c)
        case .botBy(let c):
            return LalyLayoutAttributor(.bottom, .equal, const: c)
        case .centerYBy(let c):
            return LalyLayoutAttributor(.centerY, .equal, const: c)
        }
    }
}

public enum LayoutYOperationAxis {
    case topBy(_ margin: LalyMargin)
    case botBy(_ margin: LalyMargin)
    case centerYBy(_ margin: LalyMargin)
    
    static func atributorFor(_ type: LayoutYOperationAxis) -> LalyLayoutAttributor {
        switch type {
        case .topBy(let c):
            return LalyLayoutAttributor(.top, c.relation, const: c.points)
        case .botBy(let c):
            return LalyLayoutAttributor(.bottom, c.relation, const: c.points)
        case .centerYBy(let c):
            return LalyLayoutAttributor(.centerY, c.relation, const: c.points)
        }
    }
}

public enum LayoutXAxisAnchor {
    case lead
    case trail
    case centerX
    
    static func attributeFor(_ type: LayoutXAxisAnchor) -> NSLayoutConstraint.Attribute {
        switch type {
        case .lead:
            return .leading
        case .trail:
            return .trailing
        case .centerX:
            return .centerX
        }
    }
}

public enum LayoutXAxis {
    case leadBy(_ constant: CGFloat = 0)
    case trailBy(_ constant: CGFloat = 0)
    case centerXBy(_ constant: CGFloat = 0)
    
    static func atributorFor(_ type: LayoutXAxis) -> LalyLayoutAttributor {
        switch type {
        case .leadBy(let c):
            return LalyLayoutAttributor(.leading, .equal, const: c)
        case .trailBy(let c):
            return LalyLayoutAttributor(.trailing, .equal, const: c)
        case .centerXBy(let c):
            return LalyLayoutAttributor(.centerX, .equal, const: c)
        }
    }
}

public enum LayoutXOperationAxis {
    case leadBy(_ margin: LalyMargin)
    case trailBy(_ margin: LalyMargin)
    case centerXBy(_ margin: LalyMargin)
    
    static func atributorFor(_ type: LayoutXOperationAxis) -> LalyLayoutAttributor {
        switch type {
        case .leadBy(let c):
            return LalyLayoutAttributor(.leading, c.relation, const: c.points)
        case .trailBy(let c):
            return LalyLayoutAttributor(.trailing, c.relation, const: c.points)
        case .centerXBy(let c):
            return LalyLayoutAttributor(.centerX, c.relation, const: c.points)
        }
    }
}

public enum ConstraintType: Duplicatable, Hashable  {
    
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
    
    
    //    public static var allCases: [ConstraintType] {
    //        return [.top, .bot, .lead, .trail, .width, .height, .topBy(0), .botBy(0), .leadBy(0), .trailBy(0), .widthBy(0), .heightBy(0), topMultiply(0), botMultiply(0), leadMultiply(0), trailMultiply(0), widthMultiply(0),  .heightMultiply(0)]
    //    }
    
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
    
    //    private var rawValue: Int {
    //        let c = ConstraintType.allCases
    //        for (i, e) in c.enumerated() {
    //            if e.self == self {
    //                return i
    //            }
    //        }
    //        fatalError("Shouldn't be here")
    //        return 1
    //
    //    }
    
    static func attributeFor(_ type: ConstraintType) -> NSLayoutConstraint.Attribute {
        switch type {
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
    
    static func atributorFor(_ type: ConstraintType) -> LalyLayoutAttributor {
        switch type {
        case .top:
            return LalyLayoutAttributor(.top, .equal)
        case .topBy(let c):
            return LalyLayoutAttributor(.top, .equal, const: c)
        case .topMultiply(let c):
            return LalyLayoutAttributor(.top, .equal, multiply: c)
        case .bot:
            return LalyLayoutAttributor(.bottom, .equal)
        case .botBy(let c):
            return LalyLayoutAttributor(.bottom, .equal, const: c)
        case .botMultiply(let c):
            return LalyLayoutAttributor(.bottom, .equal, multiply: c)
        case .height:
            return LalyLayoutAttributor(.height, .equal)
        case .heightBy(let c):
            return LalyLayoutAttributor(.height, .equal, const: c)
        case .heightMultiply(let c):
            return LalyLayoutAttributor(.height, .equal, multiply: c)
        case .width:
            return LalyLayoutAttributor(.width, .equal)
        case .widthBy(let c):
            return LalyLayoutAttributor(.width, .equal, const: c)
        case .widthMultiply(let c):
            return LalyLayoutAttributor(.width, .equal, multiply: c)
        case .lead:
            return LalyLayoutAttributor(.leading, .equal)
        case .leadBy(let c):
            return LalyLayoutAttributor(.leading, .equal, const: c)
        case .leadMultiply(let c):
            return LalyLayoutAttributor(.leading, .equal, multiply: c)
        case .trail:
            return LalyLayoutAttributor(.trailing, .equal)
        case .trailBy(let c):
            return LalyLayoutAttributor(.trailing, .equal, const: c)
        case .trailMultiply(let c):
            return LalyLayoutAttributor(.trailing, .equal, multiply: c)
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

public enum ConstraintOperationType: Duplicatable, Hashable {
    
    case top(_ margin: LalyMargin)
    case bot(_ margin: LalyMargin)
    case lead(_ margin: LalyMargin)
    case trail(_ margin: LalyMargin)
    case width(_ margin: LalyMargin)
    case height(_ margin: LalyMargin)
    case widthMultiply(_ margin: LalyMargin)
    case heightMultiply(_ margin: LalyMargin)
    
    static func attributeFor(_ type: ConstraintOperationType) -> NSLayoutConstraint.Attribute {
        switch type {
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
    
    static func atributorFor(_ type: ConstraintOperationType) -> LalyLayoutAttributor {
        switch type {
        case .top(let c):
            return LalyLayoutAttributor(.top, c.relation, const: c.points)
        case .bot(let c):
            return LalyLayoutAttributor(.bottom, c.relation, const: c.points)
        case .lead(let c):
            return LalyLayoutAttributor(.leading, c.relation, const: c.points)
        case .trail(let c):
            return LalyLayoutAttributor(.trailing, c.relation, const: c.points)
        case .height(let c):
            return LalyLayoutAttributor(.height, c.relation, const: c.points)
        case .width(let c):
            return LalyLayoutAttributor(.width, c.relation, const: c.points)
        case .heightMultiply(let c):
            return LalyLayoutAttributor(.height, c.relation, multiply: c.points)
        case .widthMultiply(let c):
            return LalyLayoutAttributor(.width, c.relation, multiply: c.points)
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

