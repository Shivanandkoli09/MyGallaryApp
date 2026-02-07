//
//  LoginView.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var onLoginSuccess: (() -> Void)?

    var body: some View {
        VStack {
            Text("Welcome to GalleryApp")
                .font(.title)
                .padding()

            Button("Login with Google") {
                viewModel.login()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        // Observe login state and notify RootView
        .onChange(of: viewModel.isLoggedIn) { loggedIn in
            if loggedIn {
                onLoginSuccess?()
            }
        }
    }
}



#Preview {
    LoginView()
}
