//
//  UIButtonExtension.swift
//  Tranning8_9
//
//  Created by Admin on 8/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//
//
import UIKit

extension UIButton{

    @IBInspectable var borderColor: UIColor?{
        set{
            layer.masksToBounds = true
            layer.borderColor = newValue?.cgColor
            layer.borderWidth = 1.0
        }
        get{
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
    }
}

