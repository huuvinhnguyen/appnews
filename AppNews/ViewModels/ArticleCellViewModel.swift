//
//  ArticleCellViewModel.swift
//  AppNews
//
//  Created by Apple on 1/26/19.
//

import Foundation
import SDWebImage

struct ArticleCellViewModel {
    
    var imageURL: URL?
    var title: String
    var description: String
    
    init(article: Article) {
        
        imageURL = URL(string: article.image)
        title = article.title
        description = article.description
    }
}
