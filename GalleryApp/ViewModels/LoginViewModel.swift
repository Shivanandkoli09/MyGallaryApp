//
//  LoginViewModel.swift
//  GalleryApp
//
//  Created by Shivanand Koli on 07/02/26.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Combine
import FirebaseCore

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var user: UserModel?

    func login() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign-In configuration
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Get root view controller
        guard let rootViewController = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?.rootViewController else {
            return
        }

        // Use new async API
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                print("Google Sign-In error: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                return
            }

            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString
            )

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In error: \(error.localizedDescription)")
                    return
                }

                if let firebaseUser = authResult?.user {
                    self.user = UserModel(
                        id: firebaseUser.uid,
                        name: firebaseUser.displayName ?? "",
                        email: firebaseUser.email ?? "",
                        photoURL: firebaseUser.photoURL?.absoluteString
                    )
                    self.isLoggedIn = true
                }
            }
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.user = nil
        } catch {
            print("Logout error: \(error.localizedDescription)")
        }
    }
}

