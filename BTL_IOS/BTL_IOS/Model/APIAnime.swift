//
//  APIAnime.swift
//  BTL_IOS
//
//  Created by Admin on 9/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class APIAnime: BaseModel{
    var mal_id: Int?
    var title: String?
    var image_url: String?
    var url: String?
    var members: Int?
    required init(_ json: [String : Any]) {
        super.init()
        if let title = json["title"] as? String {
            self.title = title
        }
        if let image_url = json["image_url"] as? String {
            self.image_url = image_url
        }
        if let url = json ["url"] as? String {
            self.url = url
        }
        if let members = json["members"] as? Int {
            self.members = members
        }
        if let mal_id = json["mal_id"] as? Int {
            self.mal_id = mal_id
        }

    }
}
