//
//  ProfileView.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if let user = viewModel.user {
                if let photoURL = user.photoURL, let url = URL(string: photoURL) {
                    KFImage(url)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }

                Text(user.name)
                    .font(.title)
                    .bold()

                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Button(action: {
                    viewModel.logout()
                }) {
                    Text("Logout")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
            } else {
                Text("No user logged in")
            }
        }
        .padding()
        .navigationTitle("Profile")
    }
}


#Preview {
    ProfileView()
}
