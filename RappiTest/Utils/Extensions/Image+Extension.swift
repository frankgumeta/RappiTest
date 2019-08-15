//
//  Image+Extension.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

extension UIImageView {
    func image(withPath path: String) {
        guard let url = URLGenerator.url(forPoster: path) else { return }
        if let imageFromCache = StorageManager.fetchImage(fromURL: url.absoluteString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    guard let image = UIImage(data: data) else {
                        return
                    }
                    StorageManager.saveImage(image, withKey: url.absoluteString)
                    self.image = image
                }
            }
            }.resume()
    }
}
