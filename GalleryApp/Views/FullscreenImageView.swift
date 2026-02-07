//
//  FullscreenImageView.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import SwiftUI
import Kingfisher

struct FullscreenImageView: View {
    let image: ImageModel
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            KFImage(URL(string: image.url))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onTapGesture {
            isPresented = false
        }
    }
}
