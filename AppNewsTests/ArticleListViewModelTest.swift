//
//  ArticleListViewModelTest.swift
//  AppNewsTests
//
//  Created by Apple on 1/28/19.
//

import XCTest
@testable import AppNews
import RxSwift
import RxTest

class ArticleListViewModelTest: XCTestCase {
    
    func testInitialViewModel() {
        
        let scheduler = TestScheduler(initialClock: 0)
        
        let mockClient = MockArticleListingClient(response:  ListingResponse(articles: [
                Article(title: "title1", description: "description1", image: "image1", detail: "detail1"),
                Article(title: "title2", description: "description2", image: "image2", detail: "detail2")
            ]))
        let refreshTrigger = scheduler.createHotObservable([
            next(200, ()),
            next(500, ()),
            ])
        
        
        let expectedArticlesEvents = [
            next(0, EquatableArray([])),
            next(200, EquatableArray([
                Article(title: "title1", description: "description1", image: "image1", detail: "detail1"),
                
                Article(title: "title2", description: "description2", image: "image2", detail: "detail2")
               
                ])),
            
            next(500, EquatableArray([
                Article(title: "title1", description: "description1", image: "image1", detail: "detail1"),
                Article(title: "title2", description: "description2", image: "image2", detail: "detail2")
                ]))
            ]
        
        let viewModel = ArticleListViewModel(refreshTrigger: refreshTrigger.asObservable(), client: mockClient)
        
        let recordedArticles = scheduler.record(source: viewModel.articles.map { EquatableArray($0) })
        
        scheduler.start()
        
        XCTAssertEqual(recordedArticles.events, expectedArticlesEvents)
        
    }
}
