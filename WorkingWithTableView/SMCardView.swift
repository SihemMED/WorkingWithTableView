//
//  SMCardView.swift
//  WorkingWithTableView
//
//  Created by Sihem MOHAMED on 10/10/19.
//  Copyright © 2019 Simo. All rights reserved.
//

import UIKit

@IBDesignable class SMCardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 10
    @IBInspectable var shadowColor: UIColor = .lightGray
    @IBInspectable var shadowOffsetWidth: CGFloat = 0
    @IBInspectable var shadowOffsetHeight: CGFloat = 4
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        self.layer.shadowOpacity = shadowOpacity
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        self.layer.shadowPath = path.cgPath
    }
    

}
