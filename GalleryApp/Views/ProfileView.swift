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
        VStack(spacing: 24) {
            if let user = viewModel.user {
                if let photoURL = user.photoURL, let url = URL(string: photoURL) {
                    KFImage(url)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                        .shadow(radius: 6)
                }

                Text(user.name)
                    .font(.title2)
                    .bold()

                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                Button(action: {
                    viewModel.logout()
                }) {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                }
                .padding(.horizontal)
            } else {
                Text("No user logged in")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .navigationTitle("Profile")
    }
}


#Preview {
    ProfileView()
}
