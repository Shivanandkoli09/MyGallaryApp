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
    @Published var allImages: [ImageModel] = []
    private var currentPage = 0
    private let pageSize = 4

    private let repository: ImageRepositoryProtocol

    init(repository: ImageRepositoryProtocol = ImageRepository()) {
        self.repository = repository
    }

    func fetchImages() {
        let fresh = repository.fetchImages()
        allImages = fresh
        images.removeAll()
        currentPage = 0
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
