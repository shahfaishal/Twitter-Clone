//
//  LoginView.swift
//  Twitter Clone
//
//  Created by faishal on 13/05/22.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel : AuthViewModel
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            AuthHeaderView(title1: "Hello,", title2: "Welcome Back")
                        
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            } //: VSTACK
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Forgot password view...")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 32)
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            } //: HSTACK
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .frame(width: UIScreen.main.bounds.width-32*2, height: 50)
                    .foregroundColor(.white)
                    .background(Color(UIColor.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
            } label: {
                Text("Don't have an account?")
                    .font(.footnote)
                
                Text("Sign Up")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(UIColor.systemBlue))
        } //: VSTACK
        .ignoresSafeArea()
        .navigationBarHidden(true)
        
    }
}

//MARK: - PREVIEW
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
