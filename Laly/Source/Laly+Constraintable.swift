//
//  Laly+Constraintable.swift
//  Laly
//
//  Created by Beta Catalina on 7/19/19.
//  Copyright © 2019 MOBGEN. All rights reserved.
//

import UIKit

public protocol Constraintable {
    
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    
    var leftAnchor: NSLayoutXAxisAnchor { get }
    
    var rightAnchor: NSLayoutXAxisAnchor { get }
    
    var topAnchor: NSLayoutYAxisAnchor { get }
    
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    
    var widthAnchor: NSLayoutDimension { get }
    
    var heightAnchor: NSLayoutDimension { get }
    
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UILayoutGuide: Constraintable {}

extension UIView: Constraintable {}

