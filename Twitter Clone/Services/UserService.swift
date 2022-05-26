//
//  UserService.swift
//  Twitter Clone
//
//  Created by faishal on 24/05/22.
//

import Firebase

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                print("DEBUG: Name is \(user.fullName)")
                print("DEBUG: Username is \(user.username)")
                print("DEBUG: Email is \(user.email)")
                
                completion(user)
            }
    }
    
}
