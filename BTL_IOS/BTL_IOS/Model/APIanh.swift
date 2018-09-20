//
//  APIanh.swift
//  BTL_IOS
//
//  Created by Admin on 9/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class APIanh: BaseModel {
    var large: String?
    required init(_ json: [String : Any]) {
        super.init()
        if let large = json["large"] as? String {
            self.large = large
        }
    }
}
