//
//  ImageService.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import Foundation

class ImageService {
    func loadImages() -> [ImageModel] {
        guard let url = Bundle.main.url(forResource: "wallpapers", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONDecoder().decode([ImageModel].self, from: data) else {
            return []
        }
        return json
    }
}
