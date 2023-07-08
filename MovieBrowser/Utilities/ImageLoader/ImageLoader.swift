//
//  ImageLoader.swift
//  MovieBrowser
//
//  Created by AhmedFitoh on 7/8/23.
//

import UIKit

extension UIImageView {
    
    /// Load image contained in reusable cells
    func loadImageUsingCache(withUrl url: URL?, cellIndexPathRow: Int, placeHolderImage: UIImage? = nil) {
        guard let url = url else {
            return
        }
        self.image = placeHolderImage
        self.tag = cellIndexPathRow
        
        // check cached image is already fetched
        if let imageUrl = ImageCacheManager.shared.isImageAvailable(forUrl: url){
            ImageCacheManager.shared.loadImage(withUrl: imageUrl, to: self)
            return
        }

        // if not, download image from url
        WebService().downloadImage(from: url) { [weak self] data in
            DispatchQueue.main.async {
                if self?.tag != cellIndexPathRow {
                    return
                }
                if  let data = data,
                    let image = UIImage(data: data) {
                    ImageCacheManager.shared.save(image: data, withUrl: url)
                    self?.image = image
                } else {
                    print ("Invalid image @ \(url)")
                }
            }
        }
    }
    
    
    func loadImageUsingCache(withUrl url: URL?, placeHolderImage: UIImage? = nil) {
        guard let url = url else {
            return
        }
        self.image = placeHolderImage
        // check cached image is already fetched
        if let imageUrl = ImageCacheManager.shared.isImageAvailable(forUrl: url){
            ImageCacheManager.shared.loadImage(withUrl: imageUrl, to: self)
            return
        }
        // if not, download image from url
        WebService().downloadImage(from: url) { [weak self] data in
            DispatchQueue.main.async {
                if  let data = data,
                    let image = UIImage(data: data) {
                    ImageCacheManager.shared.save(image: data, withUrl: url)
                    self?.image = image
                } else {
                    print ("Invalid image @ \(url)")
                }
            }
        }
    }
}
