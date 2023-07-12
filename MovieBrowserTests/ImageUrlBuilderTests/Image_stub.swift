//
//  Image_stub.swift
//  MoviesAppTests
//
//  Created by AhmedFitoh on 7/12/23.
//

import Foundation
@testable import MovieBrowser

struct ImageModel {
    let imageName: String
    let expectedUrl: URL
    let imageSize: ImageUrlBuilder.ImageSize
}


extension ImageModel {
    static func getImageList() -> [ImageModel] {

        let originalSize = ImageModel(imageName: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
                                      expectedUrl: URL(string: "https://image.tmdb.org/t/p/original/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")!,
                                      imageSize: .original)

        let w500Size = ImageModel(imageName: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
                                  expectedUrl: URL(string: "https://image.tmdb.org/t/p/w500/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")!,
                                  imageSize: .w500)
        
        let w342Size = ImageModel(imageName: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
                                      expectedUrl: URL(string: "https://image.tmdb.org/t/p/w342/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")!,
                                      imageSize: .w342)
        let w154Size = ImageModel(imageName: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
                                      expectedUrl: URL(string: "https://image.tmdb.org/t/p/w154/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")!,
                                      imageSize: .w154)
        let w92Size = ImageModel(imageName: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
                                 expectedUrl: URL(string: "https://image.tmdb.org/t/p/w92/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")!,
                                 imageSize: .w92)
        
        return [originalSize, w500Size, w342Size, w154Size, w92Size]
    }
}

