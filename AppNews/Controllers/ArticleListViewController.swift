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
        
        viewModel.articles.bind(to: tableView.rx.items(cellIdentifier: "ArticleCell")) { _, article, cell in
                
                if let articleCell = cell as? ArticleCell {
                    
                    let articleCellViewModel = ArticleCellViewModel(article: article)
                    articleCell.display(viewModel: articleCellViewModel)
                }
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Article.self ).subscribe {  [weak self] article in
            
            self?.performSegue(withIdentifier: "ArticleDetailViewController", sender: nil)
        }.disposed(by: disposeBag)
        
//        tableView.rx.itemSelected.subscribe { [weak self] indexPath in
//                let cell = self?.tableview.cellForRow(at: indexPath) as? SomeCellClass
//                cell.button.isEnabled = false
            
                
//            }
//            .disposed(by: disposeBag)
    }
    
    private func prepareNibs() {
        
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
    }
}
