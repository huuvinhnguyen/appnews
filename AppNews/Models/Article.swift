//
//  Article.swift
//  AppNews
//
//  Created by Apple on 1/26/19.
//

import Foundation
import Himotoki

struct Article {
    
    var title: String
    var description: String
    var image: String
    var detail: String
}

extension Article: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> Article {
        
        return try Article(title: e <|  "title", description: e <| "description", image: e <| "image", detail: "detail")
    }
}

func == (lhs: Article, rhs: Article) -> Bool {
    
    return lhs.title == rhs.title && lhs.description == rhs.description
}

extension Article: Equatable {}
