//
//  AuthViewModel.swift
//  Twitter Clone
//
//  Created by faishal on 18/05/22.
//

import UIKit
import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser: Bool = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
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
            self.tempUserSession = user
            
//            let data = ["email": email, "username": username.lowercased(), "fullName": fullName, "uid": user.uid]
            let data = ["email": email, "username": username.lowercased(), "fullName": fullName]
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
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        guard let imageString = image.toJpegString(compressionQuality: 1.0) else {
            print("DEBUG: Failed to convert image to string")
            return
        }
        
        Firestore.firestore().collection("users")
            .document(uid)
            .updateData(["profileImageString": imageString]) { _ in
                self.userSession = self.tempUserSession
                print("DEBUG: Profile image uploaded")
            }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
}


