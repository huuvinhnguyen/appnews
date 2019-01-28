//
//  ArticleRequest.swift
//  AppNews
//
//  Created by Apple on 1/27/19.
//

import APIKit
import Himotoki

protocol ArticleAPIRequest: Request {}

extension ArticleAPIRequest {
    
    var baseURL: URL {
        
        return URL(string: "https://www.moneyforward.vn")!
    }
    
    var method: HTTPMethod {
        
        return .get
    }
    
    var path: String {
        
        return "/example-feed/feed.json"
    }
}

struct ArticleRequest: ArticleAPIRequest {
    
    typealias Response = ListingResponse
}

extension ArticleRequest {

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> ListingResponse {
        let elements = try decodeArray(object, rootKeyPath: ["articles"]) as [Article]

//        return ListingResponse(articles: [Article(title: "aaaa", description: "ddddd", image: "https://moneyforwardvietnam.github.io/example-feed/images/FP0919-160x160.jpg", detail: ""), Article(title: "bbbbb", description: "ttttt", image: "https://moneyforwardvietnam.github.io/example-feed/images/FP0919-160x160.jpg", detail: "")])
        
        return ListingResponse(articles: elements)

    }
}
