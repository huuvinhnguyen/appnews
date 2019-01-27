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
        
        let viewModel = ArticleListViewModel(refreshTrigger: refreshTrigger.asObservable(),
                                             client: ArticleListingClient())
        
        viewModel.articles
            .bind(to: tableView.rx.items(cellIdentifier: "ArticleCell")) { _, article, cell in
                
                cell.textLabel?.text = article.title
            }
            .disposed(by: disposeBag)

    }
    
    private func prepareNibs() {
        
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
        
    }
}

//extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? ArticleCell ?? UITableViewCell()
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        performSegue(withIdentifier: "ArticleDetailViewController", sender: nil)
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 300
//    }
//}
