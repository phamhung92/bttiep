//
//  MangaRouter.swift
//  BTL_IOS
// {
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum MangaEndpoint {
    case APItop(type: String,name: String)
    case anime1
    case anime(id: Int);
    case manga1(id: Int)
}

class MangaRoute: BaseRouter {
    
    init(endpoint: MangaEndpoint) {
        self.endpoint  = endpoint
    }
    
    override var method: String {
        return "get"
    }
    
    override var parameters: [String: Any]? {
        return nil
    }
    
    override var headerFields: [String: String]? {
        return nil
    }

    var endpoint: MangaEndpoint
    override var url: String {
        switch endpoint {

        case .APItop (let type, let name):
            return "https://api.jikan.moe/top/"+"\(type)"+"/1/"+"\(name)"
        case .anime1:
            return "https://api.jikan.moe/v3/anime/1/characters_staff"
        case .anime(let id):
            return "https://api.jikan.moe/v3/anime/" + "\(id)"+"/pictures"
        case .manga1(let id):
            return "https://api.jikan.moe/v3/manga/" + "\(id)"+"/pictures"
        }
    }

    
    override func response(json: [String: Any]) -> Any? {
        switch endpoint {
            
        case .APItop:
            guard let top = json["top"] as? [Any] else {
                return nil
            }
            var mangas = [APITop]()
            for i in top {
                if let dictionary = i as? [String:Any] {
                    let manga = APITop(dictionary)
                    mangas.append(manga)
                }
            }
                return mangas

        case .anime1:
            guard let characters = json["characters"] as? [Any] else{
                return nil
            }
            var mangas = [APIAnime]()
            for i in characters{
                if let dictionary = i as? [String:Any] {
                    let manga = APIAnime(dictionary)
                    mangas.append(manga)
                }
            }
            return mangas
            
        case .anime:
            guard let pictures = json["pictures"] as? [Any] else {
                return nil
            }
            var mangas = [APIanh]()
            for i in pictures{
                if let dictionary = i as? [String:Any] {
                    let manga = APIanh(dictionary)
                    mangas.append(manga)
                }
            }
            return mangas
            
        case .manga1:
            guard let pictures = json["pictures"] as? [Any] else {
                return nil
            }
            var mangas = [APIanh]()
            for i in pictures{
                if let dictionary = i as? [String:Any] {
                    let manga = APIanh(dictionary)
                    mangas.append(manga)
                }
            }
            return mangas
        }
    }
}
