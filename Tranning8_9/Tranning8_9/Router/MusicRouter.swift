//
//  MusicRouter.swift
//  Tranning8_9
//
//  Created by Admin on 8/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
enum MusicEndpoint{
    case search
}

class MusicRouter: BaseRouter{
    
    var endpoint: MusicEndpoint
    
    override var url: String{
        switch endpoint {
        case .search:
            return "https://itunes.apple.com/search?term=jack+johnson"
        }
    }
    
    init(endpoint: MusicEndpoint) {
        self.endpoint = endpoint
    }
    
    override var method: String {
        switch endpoint {
        case .search:
            return "get"
        }
    }
    
    override var parameters: [String: Any]? {
        switch endpoint {
        case .search:
            return nil
        }
    }
    
    
    override var headerFields: [String: String]? {
        return nil
    }
    
    override func response(json: [String:Any]) -> Any? {
        switch endpoint {
        case .search:
            guard let results = json["results"] as? [Any] else{
                return nil
            }
            var musics = [MusicModel]()
            for i in results{
                if let dictionary = i as? [String:Any]{
                    let music = MusicModel(dictionary)
                    musics.append(music)
                }
            }
            return musics
        default:
            return nil
        }
        
    }
}
