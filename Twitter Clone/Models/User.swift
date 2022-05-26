//
//  User.swift
//  Twitter Clone
//
//  Created by faishal on 24/05/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    var fullName: String
    var username: String
    var profileImageString: String
    var email: String
}
