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
    @State private var selectedImage: ImageModel?

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(viewModel.images) { image in
                        KFImage(URL(string: image.url))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 170, height: 170)
                            .clipped()
                            .onTapGesture {
                                selectedImage = image
                            }
                    }
                }
                .padding()

                if viewModel.images.count < viewModel.allImages.count {
                    Button("Load More") {
                        viewModel.loadNextPage()
                    }
                    .padding()
                }
            }
            .navigationTitle("Gallery")
            .onAppear {
                viewModel.fetchImages()
            }
            .sheet(item: $selectedImage) { image in
                FullscreenImageView(
                    image: image,
                    isPresented: Binding(
                        get: { selectedImage != nil },
                        set: { if !$0 { selectedImage = nil } }
                    )
                )
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.circle")
                        .font(.title)
                }
            )

        }
    }
}



#Preview {
    GalleryView()
}
