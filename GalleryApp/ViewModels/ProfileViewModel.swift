//
//  ProfileViewModel.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import Foundation
import FirebaseAuth
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: UserModel?

    init() {
        loadUser()
    }

    func loadUser() {
        if let firebaseUser = Auth.auth().currentUser {
            user = UserModel(
                id: firebaseUser.uid,
                name: firebaseUser.displayName ?? "",
                email: firebaseUser.email ?? "",
                photoURL: firebaseUser.photoURL?.absoluteString
            )
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            user = nil
            NotificationCenter.default.post(name: NSNotification.Name("UserLoggedOut"), object: nil)
        } catch {
            print("Logout error: \(error.localizedDescription)")
        }
    }

}
