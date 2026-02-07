//
//  RootView.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import SwiftUI
import FirebaseAuth

struct RootView: View {
    @State private var isLoggedIn: Bool = Auth.auth().currentUser != nil

    var body: some View {
        if isLoggedIn {
            GalleryView()
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("UserLoggedOut"))) { _ in
                    isLoggedIn = false
                }
        } else {
            LoginView(onLoginSuccess: {
                isLoggedIn = true
            })
        }
    }
}

#Preview {
    RootView()
}
