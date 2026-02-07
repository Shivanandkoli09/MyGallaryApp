//
//  GalleryView.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import SwiftUI
import Kingfisher

struct GalleryView: View {
    @StateObject var viewModel = GalleryViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(viewModel.images) { image in
                        KFImage(URL(string: image.url))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipped()
                    }
                }
            }
            .navigationTitle("Gallery")
            .onAppear {
                viewModel.fetchImages()
            }
        }
    }
}

#Preview {
    GalleryView()
}
