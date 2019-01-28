//
//  MockArticleListingClient.swift
//  AppNewsTests
//
//  Created by Apple on 1/28/19.
//

import Foundation
import RxSwift
import RxTest
@testable import AppNews


struct MockArticleListingClient: ListingClient {
    
    let responses: [ListingResponse]
    
    func loadArticles() -> Single<ListingResponse> {
        

        return .just(responses)
    }
}
