//
//  ArticleListViewModel.swift
//  AppNews
//
//  Created by Apple on 1/27/19.
//

import RxSwift

class ArticleListViewModel {
    
    let articleCellViewModels = [ArticleCellViewModel]()
    
    let articles: Observable<[Article]>
    
    init(
        
        refreshTrigger: Observable<Void>, client: ListingClient) {
        
        articles = refreshTrigger.flatMapLatest { _ -> Single<ListingResponse> in
            
                    client.loadArticles()
            }
            .map { $0.articles }
            .startWith([])
            .share(replay: 0)
    }
}
