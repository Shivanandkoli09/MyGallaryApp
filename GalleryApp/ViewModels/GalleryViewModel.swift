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
    @Published var allImages: [ImageModel] = []   // <-- made public so GalleryView can access
    private let service = ImageService()
    private var currentPage = 0
    private let pageSize = 4

    func fetchImages() {
        // Load all images (from JSON or Core Data)
        allImages = service.loadImages()
        loadNextPage()
    }

    func loadNextPage() {
        let start = currentPage * pageSize
        let end = min(start + pageSize, allImages.count)
        if start < end {
            let nextBatch = Array(allImages[start..<end])
            images.append(contentsOf: nextBatch)
            currentPage += 1
        }
    }
}
