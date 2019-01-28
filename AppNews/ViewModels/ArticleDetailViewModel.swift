//
//  ArticleDetailViewModel.swift
//  AppNews
//
//  Created by Apple on 1/26/19.
//

import Foundation

class  ArticleDetailViewModel {
    
    var title: String
    var imageURL: URL?
    var detail: String
    
    init(article: Article) {
        
        title = article.title
        imageURL = URL(string: article.image)
        detail = article.detail
    }
}
