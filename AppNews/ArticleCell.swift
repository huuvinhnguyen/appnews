//
//  ArticleCell.swift
//  AppNews
//
//  Created by Apple on 1/26/19.
//
import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var articleImageView : UIImageView!
    
    fileprivate(set) var viewModel: ArticleCellViewModel! {
        
        didSet {
            
            titleLabel.text = viewModel.title
            descriptionLabel.text = viewModel.description
            articleImageView?.sd_setImage(with: viewModel.imageURL, placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    func display(viewModel: ArticleCellViewModel) {
        
        self.viewModel = viewModel
    }
}
