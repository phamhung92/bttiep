//
//  BaseRoute.swift
//  BTL_IOS
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class BaseRouter {
    
    var timeOut: TimeInterval {
        return 20
    }
    
    var url:String{
        fatalError("[\(#function))] Must be overridden in subclass")
    }
    
    var method: String {
        fatalError("[\(#function))] Must be overridden in subclass")
    }
    
    var parameters: [String: Any]? {
        fatalError("[\(#function))] Must be overridden in subclass")
    }
    
    
    var headerFields: [String: String]? {
        fatalError("[\(#function))] Must be overridden in subclass")
    }
    
    func response(json: [String:Any]) -> Any? {
        fatalError("[\(#function))] Must be overridden in subclass")
    }
    
    func request(completion: @escaping((_ response: APIResult)->Void)) {
        
        guard let url = URL(string: url) else {
            completion(.fauilure(error: "URL incorrect"))
            return
        }
 
        var request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: timeOut)
        request.httpMethod = method
        if let params = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
        }
        
        request.allHTTPHeaderFields = headerFields
        print("url: \(url)")
        print("method: \(method)")
        URLSession.shared.dataTask(with: request) { (data, respon, err) in
            if err != nil {
                completion(.fauilure(error: err?.localizedDescription ?? ""))
                return
            }
            let httpResponse = respon as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            print("statusCode: \(statusCode)")
            if statusCode == 200, let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                    if let json = jsonObject, let response = self.response(json: json){
                        completion(.successful(data: response))
                    }else {
                        completion(.fauilure(error: "Parse data to [String:Any] is error"))
                    }
                }catch let err {
                    completion(.fauilure(error: err.localizedDescription))
                }
            } else  {
                completion(.fauilure(error: "Can't connect to server!"))
            }
        }.resume()
    }
}

enum APIResult {
    case successful(data: Any)
    case fauilure(error: String)
}
