//
//  ArticleListingClient.swift
//  AppNews
//
//  Created by Apple on 1/27/19.
//
import Foundation
import APIKit
import RxSwift

struct ArticleListingClient: ListingClient {
    
    func loadArticles() -> Single<ListingResponse> {
        
        let request = ArticleRequest()
        return Session.shared.rx.response(request)
    }
}
