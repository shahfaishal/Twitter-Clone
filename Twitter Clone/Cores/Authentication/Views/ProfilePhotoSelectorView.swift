//
//  ProfilePhotoSelectorView.swift
//  Twitter Clone
//
//  Created by faishal on 18/05/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            AuthHeaderView(title1: "Setup account,", title2: "Select a profile photo")
            
            ZStack(alignment: .bottomTrailing) {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .clipShape(Circle())
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
                
                Button {
                    showImagePicker.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(.white)
                        .clipShape(Circle())
                        .offset(x: -5, y: -5)
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
            } //: ZSTACK
            .padding(.top, 40)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(width: UIScreen.main.bounds.width-32*2, height: 50)
                        .foregroundColor(.white)
                        .background(Color(UIColor.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
            }
            
            Spacer()
        } //: VSTACK
        .ignoresSafeArea()
        
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}


//MARK: - MODIFIER
struct ProfileImageModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            .overlay(Circle().stroke(lineWidth: 2.0).foregroundColor(Color(UIColor.systemBlue)))
    }
    
}


//MARK: - PREVIEW
struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
