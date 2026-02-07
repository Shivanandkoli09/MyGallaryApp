//
//  GalleryView.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import SwiftUI

struct GalleryView: View {
    @StateObject var viewModel = GalleryViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.images) { image in
                Text(image.url)
            }
            .navigationTitle("Gallery")
        }
    }
}

#Preview {
    GalleryView()
}
