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
        
        let articles = try decodeArray(object, rootKeyPath: ["articles"]) as [Article]

        return ListingResponse(articles: articles)

    }
}
