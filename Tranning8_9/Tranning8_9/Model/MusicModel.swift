//
//  Music.swift
//  Tranning8_9
//
//  Created by Admin on 8/20/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class MusicModel: BaseModel {
    var trackName : String?
    var artistName : String?
    var artworkUrl100 : String?
    var trackTimeMillis: Int?
    required init(_ json: [String : Any]) {
        super.init()
        if let trackName = json["trackName"] as? String{
            self.trackName = trackName
        }
        if let artistName = json["artistName"] as? String{
            self.artistName = artistName
        }
        if let artworkUrl100 = json["artworkUrl100"] as? String{
            self.artworkUrl100 = artworkUrl100
        }
        if let trackTimeMillis = json["trackTimeMillis"] as? Int{
            self.trackTimeMillis = trackTimeMillis
        }
    }
}
