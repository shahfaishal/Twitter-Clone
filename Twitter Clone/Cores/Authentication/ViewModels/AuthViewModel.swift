//
//  AuthViewModel.swift
//  Twitter Clone
//
//  Created by faishal on 18/05/22.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is: \(self.userSession)")
    }
    
    //MARK: - METHODS
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email: \(email)")
    }
    
    func register(withEmail email: String, username: String, fullName: String, password: String) {
        print("DEBUG: Register with email: \(email)")
    }
}
