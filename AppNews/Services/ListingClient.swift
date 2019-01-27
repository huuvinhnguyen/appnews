//
//  ListingClient.swift
//  AppNews
//
//  Created by Apple on 1/27/19.
//

import RxSwift

protocol ListingClient {
    
    func loadArticles() -> Single<ListingResponse>
}
