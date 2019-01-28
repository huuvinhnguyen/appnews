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
        
        let refreshTrigger = scheduler.createHotObservable([
            next(200, ()),
            next(500, ()),
            ])
        
        
        let expectedArticlesEvents = [
            next(0, EquatableArray([])),
            next(200, EquatableArray([
                Article(title: "title1", description: "description1", image: "image1", detail: "detail1"),
               
                ])),
            next(300, EquatableArray([
                Article(title: "title1", description: "description1", image: "image1", detail: "detail1")
                
                ])),
            next(400, EquatableArray([
                Article(title: "title1", description: "description1", image: "image1", detail: "detail1")
                
                ])),
            next(500, EquatableArray([
                Article(title: "title1", description: "description1", image: "image1", detail: "detail1")
                ]))
            ]
        
        scheduler.start()
        
    }
}
