//
//  UIImageView+Extensions.swift
//  AppNews
//
//  Created by Apple on 1/27/19.
//

import Foundation
import UIKit

extension UIImageView {
    public func image(fromUrl url:URL) {
        
        let theTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            if let response = data {
                
                DispatchQueue.main.async {
                    
                    self?.image = UIImage(data: response)
                }
            }
        }
        
        theTask.resume()
    }
}
