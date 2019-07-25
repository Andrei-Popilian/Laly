//
//  ConstraintLalyLayout+LayoutEdge.swift
//  Laly
//
//  Created by Andrei Popilian on 7/18/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public extension LalyLayout  {
    
    //prediction.laly.edge(to: superView, of: .bot(10))
    @discardableResult
    func edge(to superView: Constraintable, of constraintType: ConstraintType) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch constraintType {
            
        case .topBy(let const):
            constraint = layout.topAnchor.constraint(equalTo: superView.topAnchor, constant: const)
            
        case .botBy(let const):
            constraint = layout.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: const)
            
        case .leadBy(let const):
            constraint = layout.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: const)
            
        case .trailBy(let const):
            constraint = layout.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: const)
            
        case .widthBy(.constant(let const)):
            constraint = layout.widthAnchor.constraint(equalTo: superView.widthAnchor, constant: const)
            
        case .widthBy(.multiply(let const)):
            constraint = layout.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: const)
            
        case .heightBy(.constant(let const)):
            constraint = layout.heightAnchor.constraint(equalTo: superView.heightAnchor, constant: const)
            
        case .heightBy(.multiply(let const)):
            constraint = layout.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: const)
            
        case .top:
            constraint = layout.topAnchor.constraint(equalTo: superView.topAnchor)
            
        case .bot:
            constraint = layout.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
            
        case .lead:
            constraint = layout.leadingAnchor.constraint(equalTo: superView.leadingAnchor)
            
        case .trail:
            constraint = layout.trailingAnchor.constraint(equalTo: superView.trailingAnchor)
            
        case .width:
            constraint = layout.widthAnchor.constraint(equalTo: superView.widthAnchor)
            
        case .height:
            constraint = layout.heightAnchor.constraint(equalTo: superView.heightAnchor)
        }
        
        return constraint.activated()
    }
    
    @discardableResult
    func edge(to superView: Constraintable, of type: ConstraintOperationType) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch type {
            
        case .top(let const):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.topAnchor.constraint(lessThanOrEqualTo: superView.topAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.topAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: const.points)
            }
            
        case .bot(let const):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.bottomAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.bottomAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: const.points)
            }
            
        case .lead(let const):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.leadingAnchor.constraint(lessThanOrEqualTo: superView.leadingAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.leadingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: const.points)
            }
            
        case .trail(let const):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.trailingAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.trailingAnchor.constraint(greaterThanOrEqualTo: superView.trailingAnchor, constant: const.points)
            }
            
        case .width(.constant(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.widthAnchor.constraint(lessThanOrEqualTo: superView.widthAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.widthAnchor.constraint(greaterThanOrEqualTo: superView.widthAnchor, constant: const.points)
            }
            
        case .width(.multiply(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.widthAnchor.constraint(lessThanOrEqualTo: superView.widthAnchor, multiplier: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.widthAnchor.constraint(greaterThanOrEqualTo: superView.widthAnchor, multiplier: const.points)
            }
            
        case .height(.constant(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.heightAnchor.constraint(lessThanOrEqualTo: superView.heightAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.heightAnchor.constraint(greaterThanOrEqualTo: superView.heightAnchor, constant: const.points)
            }
            
        case .height(.multiply(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.heightAnchor.constraint(lessThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.heightAnchor.constraint(greaterThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
            }
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.edges(to: imageView, ofIdentation: 10)
    //preddiction.laly.edges(to: imageView)
    @discardableResult
    func edges(to superView: Constraintable, ofIdentation const: CGFloat = 0) -> [NSLayoutConstraint] {
        
        return edges(to: superView, of: .leadBy(const), .trailBy(const), .botBy(const), .topBy(const))
    }
    
    
    //prediction.laly.edgesTo(imageView: of: .lead(10), .trail())
    @discardableResult
    func edges(to superView: Constraintable, of types: ConstraintType...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { edge(to: superView, of: $0) }
    }
    
    //prediction.laly.edgesTo(imageView: of: .lead(>=10), .trail())
    @discardableResult
    func edges(to superView: Constraintable, of types: ConstraintOperationType...) -> [NSLayoutConstraint] {
        
        types.checkForDuplicates()
        return types.map { edge(to: superView, of: $0) }
    }
    
    //prediction.laly.edge(to: photoImageView, relation: (.top, to: .bot(10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutYAxisAnchor, to: LayoutYAxis)) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch (relation.0, relation.to) {
            
        case (.top, .top(let const)):
            constraint = layout.topAnchor.constraint(equalTo: superView.topAnchor, constant: const)
            
        case (.top, .bot(let const)):
            constraint = layout.topAnchor.constraint(equalTo: superView.bottomAnchor, constant: const)
            
        case (.top, .centerY(let const)):
            constraint = layout.topAnchor.constraint(equalTo: superView.centerYAnchor, constant: const)
            
        case (.bot, .bot(let const)):
            constraint = layout.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: const)
            
        case (.bot, .top(let const)):
            constraint = layout.bottomAnchor.constraint(equalTo: superView.topAnchor, constant: const)
            
        case (.bot, .centerY(let const)):
            constraint = layout.bottomAnchor.constraint(equalTo: superView.centerYAnchor, constant: const)
            
        case (.centerY, .top(let const)):
            constraint = layout.centerYAnchor.constraint(equalTo: superView.topAnchor, constant: const)
            
        case (.centerY, .bot(let const)):
            constraint = layout.centerYAnchor.constraint(equalTo: superView.bottomAnchor, constant: const)
            
        case (.centerY, .centerY(let const)):
            constraint = layout.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: const)
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.edge(to: photoImageView, relation: (.top, to: .bot(<=10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutYAxisAnchor, to: LayoutYOperationAxis)) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch (relation.0, relation.to) {
            
        case (.top, .top(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.topAnchor.constraint(lessThanOrEqualTo: superView.topAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.topAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: const.points)
            }
            
        case (.top, .bot(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.topAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.topAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: const.points)
            }
            
        case (.top, .centerY(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.topAnchor.constraint(lessThanOrEqualTo: superView.centerYAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.topAnchor.constraint(greaterThanOrEqualTo: superView.centerYAnchor, constant: const.points)
            }
            
        case (.bot, .bot(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.bottomAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.bottomAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: const.points)
            }
            
        case (.bot, .top(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.bottomAnchor.constraint(lessThanOrEqualTo: superView.topAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.bottomAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: const.points)
            }
            
        case (.bot, .centerY(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.bottomAnchor.constraint(lessThanOrEqualTo: superView.centerYAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.bottomAnchor.constraint(greaterThanOrEqualTo: superView.centerYAnchor, constant: const.points)
            }
            
        case (.centerY, .top(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.centerYAnchor.constraint(lessThanOrEqualTo: superView.topAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.centerYAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: const.points)
            }
            
        case (.centerY, .bot(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.centerYAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.centerYAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: const.points)
            }
            
        case (.centerY, .centerY(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.centerYAnchor.constraint(lessThanOrEqualTo: superView.centerYAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.centerYAnchor.constraint(greaterThanOrEqualTo: superView.centerYAnchor, constant: const.points)
            }
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.edge(to: imageView, relation: (.lead, to: lead(10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutXAxisAnchor, to: LayoutXAxis)) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch (relation.0, relation.to) {
            
        case (.lead, .lead(let const)):
            constraint = layout.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: const)
            
        case (.lead, .trail(let const)):
            constraint = layout.leadingAnchor.constraint(equalTo: superView.trailingAnchor, constant: const)
            
        case (.lead, .centerX(let const)):
            constraint = layout.leadingAnchor.constraint(equalTo: superView.centerXAnchor, constant: const)
            
        case (.trail, .trail(let const)):
            constraint = layout.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: const)
            
        case (.trail, .lead(let const)):
            constraint = layout.trailingAnchor.constraint(equalTo: superView.leadingAnchor, constant: const)
            
        case (.trail, .centerX(let const)):
            constraint = layout.trailingAnchor.constraint(equalTo: superView.centerXAnchor, constant: const)
            
        case (.centerX, .lead(let const)):
            constraint = layout.centerXAnchor.constraint(equalTo: superView.leadingAnchor, constant: const)
            
        case (.centerX, .trail(let const)):
            constraint = layout.centerXAnchor.constraint(equalTo: superView.trailingAnchor, constant: const)
            
        case (.centerX, .centerX(let const)):
            constraint = layout.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: const)
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.edge(to: imageView, relation: (.lead, to: lead(>=10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutXAxisAnchor, to: LayoutXOperationAxis)) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch (relation.0, relation.to) {
            
        case (.lead, .lead(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.leadingAnchor.constraint(lessThanOrEqualTo: superView.leadingAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.leadingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: const.points)
            }
            
        case (.lead, .trail(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.leadingAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.leadingAnchor.constraint(greaterThanOrEqualTo: superView.trailingAnchor, constant: const.points)
            }
            
        case (.lead, .centerX(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.leadingAnchor.constraint(lessThanOrEqualTo: superView.centerXAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.leadingAnchor.constraint(greaterThanOrEqualTo: superView.centerXAnchor, constant: const.points)
            }
            
        case (.trail, .trail(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.trailingAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.trailingAnchor.constraint(greaterThanOrEqualTo: superView.trailingAnchor, constant: const.points)
            }
            
        case (.trail, .lead(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.trailingAnchor.constraint(lessThanOrEqualTo: superView.leadingAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.trailingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: const.points)
            }
            
        case (.trail, .centerX(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.trailingAnchor.constraint(lessThanOrEqualTo: superView.centerXAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.trailingAnchor.constraint(greaterThanOrEqualTo: superView.centerXAnchor, constant: const.points)
            }
            
        case (.centerX, .lead(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.centerXAnchor.constraint(lessThanOrEqualTo: superView.leadingAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.centerXAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: const.points)
            }
            
        case (.centerX, .trail(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.centerXAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.centerXAnchor.constraint(greaterThanOrEqualTo: superView.trailingAnchor, constant: const.points)
            }
            
        case (.centerX, .centerX(let const)):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.centerXAnchor.constraint(lessThanOrEqualTo: superView.centerXAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.centerXAnchor.constraint(greaterThanOrEqualTo: superView.centerXAnchor, constant: const.points)
            }
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.edges(to: imageView, relations: (.top, to: .top(-10)), (.bot, to: bot(-10)))
    @discardableResult
    func edges(to superView: Constraintable, relations: (LayoutYAxisAnchor, to: LayoutYAxis)...) -> [NSLayoutConstraint] {
        
        let fromRelations = relations.compactMap { $0.0 }
        let toRelations = relations.compactMap { $0.to }
        
        fromRelations.checkForDuplicates()
        toRelations.checkForDuplicates()
        
        return relations.map { edge(to: superView, relation: ($0.0, to: $0.to)) }
    }
    
    //prediction.laly.edges(to: imageView, relations: (.lead, to: .lead(-10)), (.trail, to: .trail(-10)))
    @discardableResult
    func edges(to superView: Constraintable, relations: (LayoutXAxisAnchor, to: LayoutXAxis)...) -> [NSLayoutConstraint] {
        
        let fromRelations = relations.compactMap { $0.0 }
        let toRelations = relations.compactMap { $0.to }
        
        fromRelations.checkForDuplicates()
        toRelations.checkForDuplicates()
        
        return relations.map { edge(to: superView, relation: ($0.0, to: $0.1)) }
    }
    
    //prediction.laly.edges(to: imageView, relations: (.top, to: .top(>=-10)), (.bot, to: bot(-10)))
    @discardableResult
    func edges(to superView: Constraintable, relations: (LayoutYAxisAnchor, to: LayoutYOperationAxis)...) -> [NSLayoutConstraint] {
        
        let fromRelations = relations.compactMap { $0.0 }
        let toRelations = relations.compactMap { $0.to }
        
        fromRelations.checkForDuplicates()
        toRelations.checkForDuplicates()
        
        return relations.map { edge(to: superView, relation: ($0.0, to: $0.1)) }
    }
    
    //prediction.laly.edges(to: imageView, relations: (.lead, to: .lead(-10)), (.trail, to: .trail(>=-10)))
    @discardableResult
    func edges(to superView: Constraintable, relations: (LayoutXAxisAnchor, to: LayoutXOperationAxis)...) -> [NSLayoutConstraint] {
        
        let fromRelations = relations.compactMap { $0.0 }
        let toRelations = relations.compactMap { $0.to }
        
        fromRelations.checkForDuplicates()
        toRelations.checkForDuplicates()
        
        return relations.map { edge(to: superView, relation: ($0.0, to: $0.1)) }
    }
}

public protocol Duplicatable {}

public enum LayoutYAxisAnchor: Duplicatable, Hashable {
    case top
    case bot
    case centerY
    
    private var rawValue: Int {
        switch self {
        case .top:
            return 0
        case .bot:
            return 1
        case .centerY:
            return 2
        }
    }
    
    public static func == (lhs: LayoutYAxisAnchor, rhs: LayoutYAxisAnchor) -> Bool {
        switch (lhs, rhs) {
        case (.top, .top),
             (.bot, .bot),
             (.centerY, .centerY):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum LayoutYAxis: Duplicatable, Hashable {
    case top(_ constant: CGFloat = 0)
    case bot(_ constant: CGFloat = 0)
    case centerY(_ constant: CGFloat = 0)
    
    private var rawValue: Int {
        switch self {
        case .top:
            return 0
        case .bot:
            return 1
        case .centerY:
            return 2
        }
    }
    
    public static func == (lhs: LayoutYAxis, rhs: LayoutYAxis) -> Bool {
        switch (lhs, rhs) {
        case (.top, .top),
             (.bot, .bot),
             (.centerY, .centerY):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum LayoutYOperationAxis: Duplicatable, Hashable {
    case top(_ margin: LalyMargin)
    case bot(_ margin: LalyMargin)
    case centerY(_ margin: LalyMargin)
    
    private var rawValue: Int {
        switch self {
        case .top:
            return 0
        case .bot:
            return 1
        case .centerY:
            return 2
        }
    }
    
    public static func == (lhs: LayoutYOperationAxis, rhs: LayoutYOperationAxis) -> Bool {
        switch (lhs, rhs) {
        case (.top, .top),
             (.bot, .bot),
             (.centerY, .centerY):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum LayoutXAxisAnchor: Duplicatable, Hashable {
    case lead
    case trail
    case centerX
    
    private var rawValue: Int {
        switch self {
        case .lead:
            return 0
        case .trail:
            return 1
        case .centerX:
            return 2
        }
    }
    
    public static func == (lhs: LayoutXAxisAnchor, rhs: LayoutXAxisAnchor) -> Bool {
        switch (lhs, rhs) {
        case (.lead, .lead),
             (.trail, .trail),
             (.centerX, .centerX):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum LayoutXAxis: Duplicatable, Hashable {
    case lead(_ constant: CGFloat = 0)
    case trail(_ constant: CGFloat = 0)
    case centerX(_ constant: CGFloat = 0)
    
    private var rawValue: Int {
        switch self {
        case .lead:
            return 0
        case .trail:
            return 1
        case .centerX:
            return 2
        }
    }
    
    public static func == (lhs: LayoutXAxis, rhs: LayoutXAxis) -> Bool {
        switch (lhs, rhs) {
        case (.lead, .lead),
             (.trail, .trail),
             (.centerX, .centerX):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum LayoutXOperationAxis: Duplicatable, Hashable {
    case lead(_ margin: LalyMargin)
    case trail(_ margin: LalyMargin)
    case centerX(_ margin: LalyMargin)
    
    private var rawValue: Int {
        switch self {
        case .lead:
            return 0
        case .trail:
            return 1
        case .centerX:
            return 2
        }
    }
    
    public static func == (lhs: LayoutXOperationAxis, rhs: LayoutXOperationAxis) -> Bool {
        switch (lhs, rhs) {
        case (.lead, .lead),
             (.trail, .trail),
             (.centerX, .centerX):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum ConstraintType: Duplicatable, Hashable {
    case topBy(_ constant: CGFloat = 0)
    case botBy(_ constant: CGFloat = 0)
    case leadBy(_ constant: CGFloat = 0)
    case trailBy(_ constant: CGFloat = 0)
    case widthBy(LayoutSizeType)
    case heightBy(LayoutSizeType)
    case top
    case bot
    case lead
    case trail
    case width
    case height
    
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
        case .width:
            return 4
        case .height:
            return 5
        case .topBy:
            return 6
        case .botBy:
            return 7
        case .leadBy:
            return 8
        case .trailBy:
            return 9
        case .widthBy:
            return 10
        case .heightBy:
            return 11
        }
    }
    
    public static func == (lhs: ConstraintType, rhs: ConstraintType) -> Bool {
        switch (lhs, rhs) {
        case (.top, .top),
             (.bot, .bot),
             (.lead, .lead),
             (.trail, .trail),
             (.width, .width),
             (.height, .height),
             (.topBy, .topBy),
             (.botBy, .botBy),
             (.leadBy, .leadBy),
             (.trailBy, .trailBy),
             (.widthBy, .widthBy),
             (.heightBy, .heightBy):
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
    case width(LayoutSizeOperationType)
    case height(LayoutSizeOperationType)
    
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
        case .width:
            return 4
        case .height:
            return 5
        }
    }
    
    public static func == (lhs: ConstraintOperationType, rhs: ConstraintOperationType) -> Bool {
        switch (lhs, rhs) {
        case (.top, .top),
             (.bot, .bot),
             (.lead, .lead),
             (.trail, .trail),
             (.width, .width),
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
