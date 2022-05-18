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
    @Published var didAuthenticateUser: Bool = false
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    //MARK: - METHODS
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user

            print("DEBUG: Did log user in")
            print("DEBUG: User is \(user)")
        }
    }
    
    func register(withEmail email: String, username: String, fullName: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
//            self.userSession = user
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: User is \(user)")
            
            let data = ["email": email, "username": username.lowercased(), "full_name": fullName, "uid": user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data")
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        //SET USER SESSION NIL TO OEPN LOGIN VIEW
        userSession = nil
        
        //SIGN OUT FROM SERVER
        try? Auth.auth().signOut()
    }
    
}
