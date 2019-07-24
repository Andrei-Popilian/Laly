//
//  ConstraintLalyLayout+LayoutDimension.swift
//  Laly
//
//  Created by Beta Catalina on 7/18/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public extension LalyLayout  {
    
    //prediction.laly.size(.height(>=10))
    @discardableResult
    func size(_ dimensionType: LayoutOperationSize) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch dimensionType {
        case .height(let const):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.heightAnchor.constraint(lessThanOrEqualToConstant: const.points)
            case .greaterThanOrEqual:
                constraint = layout.heightAnchor.constraint(greaterThanOrEqualToConstant: const.points)
            }
            
        case .width(let const):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.widthAnchor.constraint(lessThanOrEqualToConstant: const.points)
            case .greaterThanOrEqual:
                constraint = layout.widthAnchor.constraint(greaterThanOrEqualToConstant: const.points)
            }
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.size(.height(10))
    @discardableResult
    func size(_ dimensionType: LayoutSize) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch dimensionType {
        case .height(let const):
            constraint = layout.heightAnchor.constraint(equalToConstant: const)
            
        case .width(let const):
            constraint = layout.widthAnchor.constraint(equalToConstant: const)
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.size(.height(>=10), .width(>=10))
    @discardableResult
    func sizes(_ dimensionTypes: LayoutOperationSize...) -> [NSLayoutConstraint] {
        
        dimensionTypes.checkForDuplicates()
        return dimensionTypes.map { size($0) }
    }
    
    //prediction.laly.size(.height(10), .width(10))
    @discardableResult
    func sizes(_ dimensionTypes: LayoutSize...) -> [NSLayoutConstraint] {
        
        dimensionTypes.checkForDuplicates()
        return dimensionTypes.map { size($0) }
    }
    
    
    //prediction.laly.size(of: imageView, relation: (.height, to: .height(10)))
    @discardableResult
    func size(of superView: Constraintable, relation constraintType: (SimpleLayoutSize, to: DetailedLayoutSize)) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch (constraintType.0, constraintType.to) {
            
        case (.height, .height(.constant(let const))):
            constraint = layout.heightAnchor.constraint(equalTo: superView.heightAnchor, constant: const)
            
        case (.height, .height(.multiply(let const))):
            constraint = layout.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: const)
            
        case (.height, .width(.constant(let const))):
            constraint = layout.heightAnchor.constraint(equalTo: superView.widthAnchor, constant: const)
            
        case (.height, .width(.multiply(let const))):
            constraint = layout.heightAnchor.constraint(equalTo: superView.widthAnchor, multiplier: const)
            
        case (.width, .width(.constant(let const))):
            constraint = layout.widthAnchor.constraint(equalTo: superView.widthAnchor, constant: const)
            
        case (.width, .width(.multiply(let const))):
            constraint = layout.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: const)
            
        case (.width, .height(.constant(let const))):
            constraint = layout.widthAnchor.constraint(equalTo: superView.heightAnchor, constant: const)
            
        case (.width, .height(.multiply(let const))):
            constraint = layout.widthAnchor.constraint(equalTo: superView.heightAnchor, multiplier: const)
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.size(of: imageview, relation: (.height, to: .height(>=10)))
    @discardableResult
    func size(of superView: Constraintable, relation constraintType: (SimpleLayoutSize, to: DetailedOperationLayoutSize)) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch (constraintType.0, constraintType.to) {
            
        case (.height, .height(.constant(let const))):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.heightAnchor.constraint(lessThanOrEqualTo: superView.heightAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.heightAnchor.constraint(greaterThanOrEqualTo: superView.heightAnchor, constant: const.points)
            }
            
        case (.height, .height(.multiply(let const))):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.heightAnchor.constraint(lessThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.heightAnchor.constraint(greaterThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
            }
            
        case (.height, .width(.constant(let const))):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.heightAnchor.constraint(lessThanOrEqualTo: superView.widthAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.heightAnchor.constraint(greaterThanOrEqualTo: superView.widthAnchor, constant: const.points)
            }
            
        case (.height, .width(.multiply(let const))):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.heightAnchor.constraint(lessThanOrEqualTo: superView.widthAnchor, multiplier: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.heightAnchor.constraint(greaterThanOrEqualTo: superView.widthAnchor, multiplier: const.points)
            }
            
        case (.width, .width(.constant(let const))):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.widthAnchor.constraint(lessThanOrEqualTo: superView.widthAnchor, constant: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.widthAnchor.constraint(greaterThanOrEqualTo: superView.widthAnchor, constant: const.points)
            }
            
        case (.width, .width(.multiply(let const))):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.widthAnchor.constraint(lessThanOrEqualTo: superView.widthAnchor, multiplier: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.widthAnchor.constraint(greaterThanOrEqualTo: superView.widthAnchor, multiplier: const.points)
            }
            
        case (.width, .height(.constant(let const))):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.widthAnchor.constraint(lessThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.widthAnchor.constraint(greaterThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
            }
            
        case (.width, .height(.multiply(let const))):
            switch const.relation {
            case .lessThanOrEqual:
                constraint = layout.widthAnchor.constraint(lessThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
                
            case .greaterThanOrEqual:
                constraint = layout.widthAnchor.constraint(greaterThanOrEqualTo: superView.heightAnchor, multiplier: const.points)
            }
        }
        
        return constraint.activated()
    }
    
    //prediction.laly.sizes(of: imageView, relations: (.height, to: height(10)), (.width, to: .width(15)))
    @discardableResult
    func sizes(of superView: Constraintable, relations layoutRelations: (SimpleLayoutSize, to: DetailedLayoutSize)...) -> [NSLayoutConstraint] {
        
        let fromRelations = layoutRelations.compactMap { $0.0 }
        let toRelations = layoutRelations.compactMap { $0.to }
        
        fromRelations.checkForDuplicates()
        toRelations.checkForDuplicates()
        
        return layoutRelations.map { size(of: superView, relation: ($0.0, to: $0.to)) }
    }
    
    //prediction.laly.sizes(to: imageView)
    @discardableResult
    func sizes(of superView: Constraintable) -> [NSLayoutConstraint] {
        
        return sizes(of: superView, relations: (.width, to: .width(.constant())), (.height, to: .height(.constant())))
    }
    
    //prediction.laly.sizes(of: imageView, relations: (.height, to: height(>=10)), (.width, to: .width(<=15)))
    @discardableResult
    func sizes(of superView: Constraintable, relations layoutRelations: (SimpleLayoutSize, to: DetailedOperationLayoutSize)...) -> [NSLayoutConstraint] {
        
        let fromRelations = layoutRelations.compactMap { $0.0 }
        let toRelations = layoutRelations.compactMap { $0.to }
        
        fromRelations.checkForDuplicates()
        toRelations.checkForDuplicates()
        
        return layoutRelations.map { size(of: superView, relation: ($0.0, to: $0.to)) }
    }
}


public enum LayoutOperationSize: Hashable, Duplicatable {
    
    case height(_ constant: LalyMargin)
    case width(_ constant: LalyMargin)
    
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

public enum LayoutSize: Hashable, Duplicatable {
    
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
    
    public static func == (lhs: LayoutSize, rhs: LayoutSize) -> Bool {
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

public enum DetailedLayoutSize: Hashable, Duplicatable {
    
    case width(LayoutSizeType)
    case height(LayoutSizeType)
    
    private var rawValue: Int {
        switch self {
        case .width:
            return 0
        case .height:
            return 1
        }
    }
    
    public static func == (lhs: DetailedLayoutSize, rhs: DetailedLayoutSize) -> Bool {
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

public enum DetailedOperationLayoutSize: Hashable, Duplicatable {
    
    case width(LayoutSizeOperationType)
    case height(LayoutSizeOperationType)
    
    private var rawValue: Int {
        switch self {
        case .width:
            return 0
        case .height:
            return 1
        }
    }
    
    public static func == (lhs: DetailedOperationLayoutSize, rhs: DetailedOperationLayoutSize) -> Bool {
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


public enum LayoutSizeType: Hashable {
    case multiply(_ multiplier: CGFloat = 1)
    case constant(_ constant: CGFloat = 0)
    
    private var rawValue: Int {
        switch self {
        case .constant:
            return 0
        case .multiply:
            return 1
        }
    }
    
    public static func == (lhs: LayoutSizeType, rhs: LayoutSizeType) -> Bool {
        switch (lhs, rhs) {
        case (.multiply, .multiply),
             (.constant, .constant):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum LayoutSizeOperationType: Hashable {
    case multiply(_ multiplier: LalyMargin)
    case constant(_ constant: LalyMargin)
    
    private var rawValue: Int {
        switch self {
        case .constant:
            return 0
        case .multiply:
            return 1
        }
    }
    
    public static func == (lhs: LayoutSizeOperationType, rhs: LayoutSizeOperationType) -> Bool {
        switch (lhs, rhs) {
        case (.multiply, .multiply),
             (.constant, .constant):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public enum SimpleLayoutSize: Hashable, Duplicatable {
    case width
    case height
    
    private var rawValue: Int {
        switch self {
        case .width:
            return 0
        case .height:
            return 1
        }
    }
    
    public static func == (lhs: SimpleLayoutSize, rhs: SimpleLayoutSize) -> Bool {
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



