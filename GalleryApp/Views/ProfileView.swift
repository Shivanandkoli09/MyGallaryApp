//
//  ProfileView.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        VStack {
            if let user = viewModel.user {
                Text(user.name)
                Text(user.email)
                Button("Logout") {
                    // logout logic
                }
            } else {
                Text("No user logged in")
            }
        }
    }
}

#Preview {
    ProfileView()
}
