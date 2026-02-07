//
//  LoginView.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoggedIn {
                GalleryView() // Navigate to gallery after login
            } else {
                Text("Welcome to GalleryApp")
                Button("Login with Google") {
                    viewModel.login()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
