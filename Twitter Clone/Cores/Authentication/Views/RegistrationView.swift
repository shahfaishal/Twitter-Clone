//
//  RegistrationView.swift
//  Twitter Clone
//
//  Created by faishal on 13/05/22.
//

import SwiftUI

struct RegistrationView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthenticateUser, label: {})
            
            AuthHeaderView(title1: "Get started,", title2: "Create your account")
                        
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    .keyboardType(.emailAddress)
                
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                    .keyboardType(.emailAddress)
                
                CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullName)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            } //: VSTACK
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            Button {
                viewModel.register(withEmail: email, username: username, fullName: fullName, password: password)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .frame(width: UIScreen.main.bounds.width-32*2, height: 50)
                    .foregroundColor(.white)
                    .background(Color(UIColor.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Already have an account?")
                    .font(.footnote)

                Text("Sign In")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 32)
        } //: VSTACK
        .ignoresSafeArea()
        .navigationBarHidden(true)
        
    }
}

//MARK: - PREVIEW
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
