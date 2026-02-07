//
//  GalleryViewModel.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import Foundation

protocol ImageRepositoryProtocol {
    func fetchImages() -> [ImageModel]
    func saveImages(_ images: [ImageModel])
    func loadCachedImages() -> [ImageModel]
}

class ImageRepository: ImageRepositoryProtocol {
    private let service = ImageService()

    func fetchImages() -> [ImageModel] {
        return service.loadImages()
    }

    func saveImages(_ images: [ImageModel]) {
        service.saveImages(images)
    }

    func loadCachedImages() -> [ImageModel] {
        return service.loadCachedImages()
    }
}
