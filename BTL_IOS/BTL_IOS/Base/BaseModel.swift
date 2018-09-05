//
//  BaseModel.swift
//  BTL_IOS
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class BaseModel : NSObject{
    override init() {
        super.init()
    }
    required init(_ json : [String:Any]){}
}
