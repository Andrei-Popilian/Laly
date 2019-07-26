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
    func edge(to superView: Constraintable, of type: ConstraintType) -> NSLayoutConstraint {
        
        let selfAttribute = ConstraintType.attributeFor(type)
        let attributor = ConstraintType.atributorFor(type)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
        
        //        var constraint: NSLayoutConstraint
        //
        //        switch constraintType {
        //
        //        case .topBy(let const):
        //            constraint = layout.topAnchor.constraint(equalTo: superView.topAnchor, constant: const)
        //
        //        case .botBy(let const):
        //            constraint = layout.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: const)
        //
        //        case .leadBy(let const):
        //            constraint = layout.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: const)
        //
        //        case .trailBy(let const):
        //            constraint = layout.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: const)
        //
        //        case .widthBy(.constant(let const)):
        //            constraint = layout.widthAnchor.constraint(equalTo: superView.widthAnchor, constant: const)
        //
        //        case .widthBy(.multiply(let const)):
        //            constraint = layout.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: const)
        //
        //        case .heightBy(.constant(let const)):
        //            constraint = layout.heightAnchor.constraint(equalTo: superView.heightAnchor, constant: const)
        //
        //        case .heightBy(.multiply(let const)):
        //            constraint = layout.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: const)
        //
        //        case .top:
        //            constraint = layout.topAnchor.constraint(equalTo: superView.topAnchor)
        //
        //        case .bot:
        //            constraint = layout.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        //
        //        case .lead:
        //            constraint = layout.leadingAnchor.constraint(equalTo: superView.leadingAnchor)
        //
        //        case .trail:
        //            constraint = layout.trailingAnchor.constraint(equalTo: superView.trailingAnchor)
        //
        //        case .width:
        //            constraint = layout.widthAnchor.constraint(equalTo: superView.widthAnchor)
        //
        //        case .height:
        //            constraint = layout.heightAnchor.constraint(equalTo: superView.heightAnchor)
        //        }
        //
        //        return constraint.activated()
    }
    
    @discardableResult
    func edge(to superView: Constraintable, of type: ConstraintOperationType) -> NSLayoutConstraint {
        
        let selfAttribute = ConstraintOperationType.attributeFor(type)
        let attributor = ConstraintOperationType.atributorFor(type)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
        
        //        var constraint: NSLayoutConstraint
        //
        //        switch type {
        //
        //        case .top(let const):
        //            switch const.relation {
        //            case .lessThanOrEqual:
        //                constraint = layout.topAnchor.constraint(lessThanOrEqualTo: superView.topAnchor, constant: const.points)
        //
        //            case .greaterThanOrEqual:
        //                constraint = layout.topAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: const.points)
        //            }
        //
        //        case .bot(let const):
        //            switch const.relation {
        //            case .lessThanOrEqual:
        //                constraint = layout.bottomAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor, constant: const.points)
        //
        //            case .greaterThanOrEqual:
        //                constraint = layout.bottomAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: const.points)
        //            }
        //
        //        case .lead(let const):
        //            switch const.relation {
        //            case .lessThanOrEqual:
        //                constraint = layout.leadingAnchor.constraint(lessThanOrEqualTo: superView.leadingAnchor, constant: const.points)
        //
        //            case .greaterThanOrEqual:
        //                constraint = layout.leadingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: const.points)
        //            }
        //
        //        case .trail(let const):
        //            switch const.relation {
        //            case .lessThanOrEqual:
        //                constraint = layout.trailingAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor, constant: const.points)
        //
        //            case .greaterThanOrEqual:
        //                constraint = layout.trailingAnchor.constraint(greaterThanOrEqualTo: superView.trailingAnchor, constant: const.points)
        //            }
        //
        //        case .width(.constant(let const)):
        //            switch const.relation {
        //            case .lessThanOrEqual:
        //                constraint = layout.widthAnchor.constraint(lessThanOrEqualTo: superView.widthAnchor, constant: const.points)
        //
        //            case .greaterThanOrEqual:
        //                constraint = layout.widthAnchor.constraint(greaterThanOrEqualTo: superView.widthAnchor, constant: const.points)
        //            }
        //
        //        case .width(.multiply(let const)):
        //            switch const.relation {
        //            case .lessThanOrEqual:
        //                constraint = layout.widthAnchor.constraint(lessThanOrEqualTo: superView.widthAnchor, multiplier: const.points)
        //
        //            case .greaterThanOrEqual:
        //                constraint = layout.widthAnchor.constraint(greaterThanOrEqualTo: superView.widthAnchor, multiplier: const.points)
        //            }
        //
        //        case .height(.constant(let const)):
        //            switch const.relation {
        //            case .lessThanOrEqual:
        //                constraint = layout.heightAnchor.constraint(lessThanOrEqualTo: superView.heightAnchor, constant: const.points)
        //
        //            case .greaterThanOrEqual:
        //                constraint = layout.heightAnchor.constraint(greaterThanOrEqualTo: superView.heightAnchor, constant: const.points)
        //            }
        //
        //        case .height(.multiply(let const)):
        //            switch const.relation {
        //            case .lessThanOrEqual:
        //                constraint = layout.heightAnchor.constraint(lessThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
        //
        //            case .greaterThanOrEqual:
        //                constraint = layout.heightAnchor.constraint(greaterThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
        //            }
        //        }
        //
        //        return constraint.activated()
    }
    
    //prediction.laly.edges(to: imageView, ofIdentation: 10)
    //preddiction.laly.edges(to: imageView)
    @discardableResult
    func edges(to superView: Constraintable, ofIdentation const: CGFloat = 0) -> [NSLayoutConstraint] {
        
        return edges(to: superView, of: .leadBy(const), .trailBy(-const), .botBy(-const), .topBy(const))
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
        
        let selfAttribute = LayoutYAxisAnchor.attributeFor(relation.0)
        let attributor = LayoutYAxis.atributorFor(relation.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    //        var constraint: NSLayoutConstraint
    //
    //        switch (relation.0, relation.to) {
    //
    //        case (.top, .top(let const)):
    //            constraint = layout.topAnchor.constraint(equalTo: superView.topAnchor, constant: const)
    //
    //        case (.top, .bot(let const)):
    //            constraint = layout.topAnchor.constraint(equalTo: superView.bottomAnchor, constant: const)
    //
    //        case (.top, .centerY(let const)):
    //            constraint = layout.topAnchor.constraint(equalTo: superView.centerYAnchor, constant: const)
    //
    //        case (.bot, .bot(let const)):
    //            constraint = layout.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: const)
    //
    //        case (.bot, .top(let const)):
    //            constraint = layout.bottomAnchor.constraint(equalTo: superView.topAnchor, constant: const)
    //
    //        case (.bot, .centerY(let const)):
    //            constraint = layout.bottomAnchor.constraint(equalTo: superView.centerYAnchor, constant: const)
    //
    //        case (.centerY, .top(let const)):
    //            constraint = layout.centerYAnchor.constraint(equalTo: superView.topAnchor, constant: const)
    //
    //        case (.centerY, .bot(let const)):
    //            constraint = layout.centerYAnchor.constraint(equalTo: superView.bottomAnchor, constant: const)
    //
    //        case (.centerY, .centerY(let const)):
    //            constraint = layout.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: const)
    //        }
    //
    //        return constraint.activated()
    //    }
    
    //prediction.laly.edge(to: photoImageView, relation: (.top, to: .bot(<=10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutYAxisAnchor, to: LayoutYOperationAxis)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutYAxisAnchor.attributeFor(relation.0)
        let attributor = LayoutYOperationAxis.atributorFor(relation.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    
    //        var constraint: NSLayoutConstraint
    //
    //        switch (relation.0, relation.to) {
    //
    //        case (.top, .top(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.topAnchor.constraint(lessThanOrEqualTo: superView.topAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.topAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: const.points)
    //            }
    //
    //        case (.top, .bot(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.topAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.topAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: const.points)
    //            }
    //
    //        case (.top, .centerY(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.topAnchor.constraint(lessThanOrEqualTo: superView.centerYAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.topAnchor.constraint(greaterThanOrEqualTo: superView.centerYAnchor, constant: const.points)
    //            }
    //
    //        case (.bot, .bot(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.bottomAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.bottomAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: const.points)
    //            }
    //
    //        case (.bot, .top(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.bottomAnchor.constraint(lessThanOrEqualTo: superView.topAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.bottomAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: const.points)
    //            }
    //
    //        case (.bot, .centerY(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.bottomAnchor.constraint(lessThanOrEqualTo: superView.centerYAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.bottomAnchor.constraint(greaterThanOrEqualTo: superView.centerYAnchor, constant: const.points)
    //            }
    //
    //        case (.centerY, .top(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.centerYAnchor.constraint(lessThanOrEqualTo: superView.topAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.centerYAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: const.points)
    //            }
    //
    //        case (.centerY, .bot(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.centerYAnchor.constraint(lessThanOrEqualTo: superView.bottomAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.centerYAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: const.points)
    //            }
    //
    //        case (.centerY, .centerY(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.centerYAnchor.constraint(lessThanOrEqualTo: superView.centerYAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.centerYAnchor.constraint(greaterThanOrEqualTo: superView.centerYAnchor, constant: const.points)
    //            }
    //        }
    //
    //        return constraint.activated()
    //    }
    
    //prediction.laly.edge(to: imageView, relation: (.lead, to: lead(10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutXAxisAnchor, to: LayoutXAxis)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutXAxisAnchor.attributeFor(relation.0)
        let attributor = LayoutXAxis.atributorFor(relation.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    //        var constraint: NSLayoutConstraint
    //
    //        switch (relation.0, relation.to) {
    //
    //        case (.lead, .lead(let const)):
    //            constraint = layout.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: const)
    //
    //        case (.lead, .trail(let const)):
    //            constraint = layout.leadingAnchor.constraint(equalTo: superView.trailingAnchor, constant: const)
    //
    //        case (.lead, .centerX(let const)):
    //            constraint = layout.leadingAnchor.constraint(equalTo: superView.centerXAnchor, constant: const)
    //
    //        case (.trail, .trail(let const)):
    //            constraint = layout.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: const)
    //
    //        case (.trail, .lead(let const)):
    //            constraint = layout.trailingAnchor.constraint(equalTo: superView.leadingAnchor, constant: const)
    //
    //        case (.trail, .centerX(let const)):
    //            constraint = layout.trailingAnchor.constraint(equalTo: superView.centerXAnchor, constant: const)
    //
    //        case (.centerX, .lead(let const)):
    //            constraint = layout.centerXAnchor.constraint(equalTo: superView.leadingAnchor, constant: const)
    //
    //        case (.centerX, .trail(let const)):
    //            constraint = layout.centerXAnchor.constraint(equalTo: superView.trailingAnchor, constant: const)
    //
    //        case (.centerX, .centerX(let const)):
    //            constraint = layout.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: const)
    //        }
    //
    //        return constraint.activated()
    //    }
    
    //prediction.laly.edge(to: imageView, relation: (.lead, to: lead(>=10)))
    @discardableResult
    func edge(to superView: Constraintable, relation: (LayoutXAxisAnchor, to: LayoutXOperationAxis)) -> NSLayoutConstraint {
        
        let selfAttribute = LayoutXAxisAnchor.attributeFor(relation.0)
        let attributor = LayoutXOperationAxis.atributorFor(relation.to)
        
        return constraintWithAttributor(attributor, selfAttribute, superView)
    }
    //        var constraint: NSLayoutConstraint
    //
    //        switch (relation.0, relation.to) {
    //
    //        case (.lead, .lead(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.leadingAnchor.constraint(lessThanOrEqualTo: superView.leadingAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.leadingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: const.points)
    //            }
    //
    //        case (.lead, .trail(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.leadingAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.leadingAnchor.constraint(greaterThanOrEqualTo: superView.trailingAnchor, constant: const.points)
    //            }
    //
    //        case (.lead, .centerX(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.leadingAnchor.constraint(lessThanOrEqualTo: superView.centerXAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.leadingAnchor.constraint(greaterThanOrEqualTo: superView.centerXAnchor, constant: const.points)
    //            }
    //
    //        case (.trail, .trail(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.trailingAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.trailingAnchor.constraint(greaterThanOrEqualTo: superView.trailingAnchor, constant: const.points)
    //            }
    //
    //        case (.trail, .lead(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.trailingAnchor.constraint(lessThanOrEqualTo: superView.leadingAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.trailingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: const.points)
    //            }
    //
    //        case (.trail, .centerX(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.trailingAnchor.constraint(lessThanOrEqualTo: superView.centerXAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.trailingAnchor.constraint(greaterThanOrEqualTo: superView.centerXAnchor, constant: const.points)
    //            }
    //
    //        case (.centerX, .lead(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.centerXAnchor.constraint(lessThanOrEqualTo: superView.leadingAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.centerXAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: const.points)
    //            }
    //
    //        case (.centerX, .trail(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.centerXAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.centerXAnchor.constraint(greaterThanOrEqualTo: superView.trailingAnchor, constant: const.points)
    //            }
    //
    //        case (.centerX, .centerX(let const)):
    //            switch const.relation {
    //            case .lessThanOrEqual:
    //                constraint = layout.centerXAnchor.constraint(lessThanOrEqualTo: superView.centerXAnchor, constant: const.points)
    //
    //            case .greaterThanOrEqual:
    //                constraint = layout.centerXAnchor.constraint(greaterThanOrEqualTo: superView.centerXAnchor, constant: const.points)
    //            }
    //        }
    //
    //        return constraint.activated()
    //    }
    
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

public enum LayoutYAxisAnchor: Duplicatable, Hashable {
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
    
    private var rawValue: Int {
        switch self {
        case .topBy:
            return 0
        case .botBy:
            return 1
        case .centerYBy:
            return 2
        }
    }
    
    public static func == (lhs: LayoutYAxis, rhs: LayoutYAxis) -> Bool {
        switch (lhs, rhs) {
        case (.topBy, .topBy),
             (.botBy, .botBy),
             (.centerYBy, .centerYBy):
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
    
    private var rawValue: Int {
        switch self {
        case .topBy:
            return 0
        case .botBy:
            return 1
        case .centerYBy:
            return 2
        }
    }
    
    public static func == (lhs: LayoutYOperationAxis, rhs: LayoutYOperationAxis) -> Bool {
        switch (lhs, rhs) {
        case (.topBy, .topBy),
             (.botBy, .botBy),
             (.centerYBy, .centerYBy):
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
    
    private var rawValue: Int {
        switch self {
        case .leadBy:
            return 0
        case .trailBy:
            return 1
        case .centerXBy:
            return 2
        }
    }
    
    public static func == (lhs: LayoutXAxis, rhs: LayoutXAxis) -> Bool {
        switch (lhs, rhs) {
        case (.leadBy, .leadBy),
             (.trailBy, .trailBy),
             (.centerXBy, .centerXBy):
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
    
    private var rawValue: Int {
        switch self {
        case .leadBy:
            return 0
        case .trailBy:
            return 1
        case .centerXBy:
            return 2
        }
    }
    
    public static func == (lhs: LayoutXOperationAxis, rhs: LayoutXOperationAxis) -> Bool {
        switch (lhs, rhs) {
        case (.leadBy, .leadBy),
             (.trailBy, .trailBy),
             (.centerXBy, .centerXBy):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum ConstraintType: CaseIterable, Duplicatable, Hashable  {
    
    case top
    case bot
    case lead
    case trail
    case width
    case height
    case topBy(_ constant: CGFloat)
    case botBy(_ constant: CGFloat)
    case leadBy(_ constant: CGFloat)
    case trailBy(_ constant: CGFloat)
    case widthBy(_ constant: CGFloat)
    case heightBy(_ constant: CGFloat)
    case topMultiply(_ value: CGFloat)
    case botMultiply(_ value: CGFloat)
    case leadMultiply(_ value: CGFloat)
    case trailMultiply(_ value: CGFloat)
    case widthMultiply(_ value: CGFloat)
    case heightMultiply(_ value: CGFloat)
    
    
    public static var allCases: [ConstraintType] {
        return [.top, .bot, .lead, .trail, .width, .height, .topBy(0), .botBy(0), .leadBy(0), .trailBy(0), .widthBy(0), .heightBy(0), topMultiply(0), botMultiply(0), leadMultiply(0), trailMultiply(0), widthMultiply(0),  .heightMultiply(0)]
    }
    
    private var rawValue: Int {
        let c = ConstraintType.allCases
        for (i, e) in c.enumerated() {
            if e == self {
                return i
            }
        }
        fatalError("Shouldn't be here")
        return 1
        
    }
    
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
    
    
    //    private var rawValue: Int {
    //
    //        let ss = ConstraintType.allCases
    //        for i in ss {
    //
    //        }
    //        switch self {
    //        case .top:
    //            return 0
    //        case .bot:
    //            return 1
    //        case .lead:
    //            return 2
    //        case .trail:
    //            return 3
    //        case .width:
    //            return 4
    //        case .height:
    //            return 5
    //        case .topBy:
    //            return 6
    //        case .botBy:
    //            return 7
    //        case .leadBy:
    //            return 8
    //        case .trailBy:
    //            return 9
    //        case .widthBy:
    //            return 10
    //        case .heightBy:
    //            return 11
    //        }
    //    }
    
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
             (.heightBy, .heightBy),
             (.top, .topBy),
             (.topBy, .top),
             (.bot, .botBy),
             (.botBy, .bot),
             (.lead, .leadBy),
             (.leadBy, .lead),
             (.trail, .trailBy),
             (.trailBy, .trail),
             (.width, .widthBy),
             (.widthBy, .width),
             (.height, .heightBy),
             (.heightBy, .height):
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
        case .height:
            return .height
        case .width:
            return .width
        case .lead:
            return .leading
        case .trail:
            return .trailing
        case widthMultiply:
            return .width
        case heightMultiply:
            return .height
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
        case (.top, .top),
             (.bot, .bot),
             (.lead, .lead),
             (.trail, .trail),
             (.width, .width),
             (.height, .height),
             (.width, .widthMultiply),
             (.height, .heightMultiply),
             (.widthMultiply, .width),
             (.heightMultiply, .height):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

//public enum LayoutSizeType: Hashable {
//    case multiply(_ multiplier: CGFloat = 1)
//    case constant(_ constant: CGFloat = 0)
//
//    private var rawValue: Int {
//        switch self {
//        case .constant:
//            return 0
//        case .multiply:
//            return 1
//        }
//    }
//
//    public static func == (lhs: LayoutSizeType, rhs: LayoutSizeType) -> Bool {
//
//        switch (lhs, rhs) {
//        case (.multiply, .multiply),
//             (.constant, .constant):
//            return true
//        default:
//            return false
//
//        }}
//
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(self.rawValue)
//    }
//}

