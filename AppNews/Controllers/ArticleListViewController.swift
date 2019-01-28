//
//  ArticleListViewController.swift
//  AppNews
//
//  Created by Apple on 1/26/19.
//
import UIKit
import RxSwift
import RxCocoa

class ArticleListViewController: UIViewController {
    
    @IBOutlet private weak var tableView : UITableView!
    
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        prepareNibs()
        
        let refreshTrigger = rx.sentMessage(#selector(viewWillAppear)).map { _ in }
        
        let viewModel = ArticleListViewModel(refreshTrigger: refreshTrigger.asObservable(), client: ArticleListingClient())
        
        viewModel.articles.bind(to: tableView.rx.items(cellIdentifier: "ArticleCell")) {  _, article, cell in
                
                if let articleCell = cell as? ArticleCell {
                    
                let articleCellViewModel = ArticleCellViewModel(article: article)
                    articleCell.display(viewModel: articleCellViewModel) 
                }
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Article.self ).subscribe(onNext: { [weak self] (article) in
            
            guard let weakSelf = self else { return }
            
            if let vc = weakSelf.storyboard?.instantiateViewController(withIdentifier :"ArticleDetailViewController") as? ArticleDetailViewController {
                
                let articleDetailViewModel = ArticleDetailViewModel(article: article)
                vc.articleDetailViewModel = articleDetailViewModel
                weakSelf.navigationController?.pushViewController(vc, animated: true)
            }
            
        }).disposed(by: disposeBag)
        
    }
    
    private func prepareNibs() {
        
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
    }
}
