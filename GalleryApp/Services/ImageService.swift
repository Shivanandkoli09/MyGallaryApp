//
//  ImageService.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import CoreData

class ImageService {
    private let context = PersistenceController.shared.container.viewContext

    func loadImages() -> [ImageModel] {
        guard let url = Bundle.main.url(forResource: "wallpapers", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONDecoder().decode([ImageModel].self, from: data) else { return [] }
        return json
    }
    
    func saveImages(_ images: [ImageModel]) {
        for image in images {
            let cached = CachedImage(context: context)
            cached.id = image.id
            cached.url = image.url
        }
        try? context.save()
    }

    func loadCachedImages() -> [ImageModel] {
        let request: NSFetchRequest<CachedImage> = CachedImage.fetchRequest()
        if let results = try? context.fetch(request) {
            return results.map { ImageModel(id: $0.id ?? "", url: $0.url ?? "") }
        }
        return []
    }
}

