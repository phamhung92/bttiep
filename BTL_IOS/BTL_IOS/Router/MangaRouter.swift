//
//  MangaRouter.swift
//  BTL_IOS
// {
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
enum MangaEndpoint{
    case search
    case search1
    case search2
    case manga
    case manhwa
    case manhua
    case oneshots
    case novels
    case anime1
}

class MangaRoute : BaseRouter{
    var endpoint : MangaEndpoint
    override var url : String {
        switch endpoint {
        case .search :
            return "https://api.jikan.moe/top/anime/1/upcoming"
        case .search1 :
            return "https://api.jikan.moe/top/anime/1/movie"
        case .search2 :
            return "https://api.jikan.moe/top/anime/1/special"
        case .manga:
            return "https://api.jikan.moe/top/manga/1/manga"
        case .manhwa:
            return "https://api.jikan.moe/top/manga/1/manhwa"
        case .manhua:
            return "https://api.jikan.moe/top/manga/1/manhua"
        case .oneshots:
            return "https://api.jikan.moe/top/manga/1/oneshots"
        case .novels:
            return "https://api.jikan.moe/top/manga/1/novels"
        case .anime1:
            return "https://api.jikan.moe/v3/anime/1/characters_staff"
        }
    
            
        
        
    }
    init(endpoint : MangaEndpoint) {
        self.endpoint  = endpoint
    }
    
    override var method: String {
        switch endpoint{
        case .search :
            return "get"
        case .search1:
            return "get"
        case .search2 :
            return "get"
        case .manga:
            return "get"
        case .manhwa:
            return "get"
        case .manhua:
            return "get"
        case .oneshots:
            return "get"
        case .novels:
            return "get"
        case .anime1:
            return "get"
        }
    }
    override var parameters: [String : Any]? {
        switch  endpoint {
        case .search:
            return nil
        case .search1:
            return nil
        case .search2:
            return nil
        case .manga:
            return nil
        case .manhwa:
            return nil
        case .manhua:
            return nil
        case .oneshots:
            return nil
        case .novels:
            return nil
        case .anime1:
            return nil
        }
    }
    override var headerFields: [String : String]?{
        return nil
    }
    override func response(json: [String : Any]) -> Any? {
        switch endpoint {
        case .search:
            guard let top = json["top"] as? [Any] else{
                return nil
            }
            var mangas = [APITop]()
            for i in top{
                if let dictionary = i as? [String:Any] {
                    let manga = APITop(dictionary)
                    mangas.append(manga)
                }
            }
                return mangas
            
        case .search1 :
            guard let top = json["top"] as? [Any] else {
                return nil
                }
            var mangas1 = [APITop]()
            for i in top{
                if let dictinonary1 = i as? [String:Any] {
                    let manga = APITop(dictinonary1)
                    mangas1.append(manga)
                }
            }
            return mangas1
            
        case .search2:
            guard let top = json["top"] as? [Any] else{
                return nil
            }
            var mangas = [APITop]()
            for i in top{
                if let dictionary = i as? [String:Any] {
                    let manga = APITop(dictionary)
                    mangas.append(manga)
                }
            }
            return mangas
        case .manga:
            guard let top = json["top"] as? [Any] else{
                return nil
            }
            var mangas = [APITop]()
            for i in top{
                if let dictionary = i as? [String:Any] {
                    let manga = APITop(dictionary)
                    mangas.append(manga)
                }
            }
            return mangas
        case .manhwa:
            guard let top = json["top"] as? [Any] else{
                return nil
            }
            var mangas = [APITop]()
            for i in top{
                if let dictionary = i as? [String:Any] {
                    let manga = APITop(dictionary)
                    mangas.append(manga)
                }
            }
            return mangas
        case .manhua:
            guard let top = json["top"] as? [Any] else{
                return nil
            }
            var mangas = [APITop]()
            for i in top{
                if let dictionary = i as? [String:Any] {
                    let manga = APITop(dictionary)
                    mangas.append(manga)
                }
            }
            return mangas
        case .oneshots:
            guard let top = json["top"] as? [Any] else{
                return nil
            }
            var mangas = [APITop]()
            for i in top{
                if let dictionary = i as? [String:Any] {
                    let manga = APITop(dictionary)
                    mangas.append(manga)
                }
            }
            return mangas
        case .novels:
            guard let top = json["top"] as? [Any] else{
                return nil
            }
            var mangas = [APITop]()
            for i in top{
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
        }
    }
    
}
