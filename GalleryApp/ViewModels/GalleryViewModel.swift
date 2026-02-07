//
//  GalleryViewModel.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import Foundation
import Combine

class GalleryViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    private let service = ImageService()

    func fetchImages() {
        images = service.loadImages()
    }
}
