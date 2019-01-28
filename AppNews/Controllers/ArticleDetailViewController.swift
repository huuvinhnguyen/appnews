//
//  ArticleDetailViewController.swift
//  AppNews
//
//  Created by Apple on 1/26/19.
//

import UIKit


class ArticleDetailViewController: UIViewController {
    
    @IBOutlet private weak var articleImageView : UIImageView!
    @IBOutlet private weak var detailLabel : UILabel!

    var articleDetailViewModel: ArticleDetailViewModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = articleDetailViewModel?.title
        if let imageURL = articleDetailViewModel?.imageURL  {
            
            articleImageView.image(fromUrl: imageURL)
        }
        detailLabel.text = articleDetailViewModel?.detail
    }
}
