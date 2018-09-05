//
//  APIAnime.swift
//  BTL_IOS
//
//  Created by Admin on 9/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class APIAnime : BaseModel{
    var url : String?
    var image_url : String?
    var name : String?
    struct  use {
        var name : String?
        var image_url : String?
    }
    required init(_ json: [String : Any]) {
        super.init()
        if let url = json["url"] as? String{
            self.url = url
        }
        if let image_url = json["url"] as? String{
            self.image_url = image_url
        }
        if let name = json["name"] as? String{
            self.name = name
        }
        
        
    }
}
