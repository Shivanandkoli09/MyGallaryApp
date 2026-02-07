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


class LoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var user: UserModel?

    func login() {
        
    }

    func logout() {
        
    }
}
