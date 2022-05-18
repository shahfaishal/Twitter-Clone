//
//  Twitter_CloneApp.swift
//  Twitter Clone
//
//  Created by faishal on 11/05/22.
//

import SwiftUI
import Firebase

@main
struct Twitter_CloneApp: App {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    //MARK: - BODY
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                ContentView()
            } //: NAVIGATION VIEW
            .environmentObject(viewModel)
            
        }
    }
}
