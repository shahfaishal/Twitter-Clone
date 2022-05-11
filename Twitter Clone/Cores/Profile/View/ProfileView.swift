//
//  ProfileView.swift
//  Twitter Clone
//
//  Created by faishal on 11/05/22.
//

import SwiftUI

struct ProfileView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    
    //MARK: - BODY
    var body: some View {
        
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            Spacer()
        } //: VSTACK
    }
}


//MARK: - EXTENSION
extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(UIColor.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    //action
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                .offset(x: 16, y: 24)
            } //: VSTACK
            
        } //: ZSTACK
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                //action
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        } //: HSTACK
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            HStack {
                Text("Bruce Wayne")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(UIColor.systemBlue))
            } //: HSTACK
            
            Text("@batman")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("Self made, richest and entertaining super hero")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Bruce Wayne")
                }//: HSTACK
                
                HStack(spacing: 4) {
                    Image(systemName: "link")
                    
                    Text("www.batman.com")
                }//: HSTACK
            } //: HSTACK
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 24) {
                HStack(spacing: 4) {
                    Text("404")
                        .font(.subheadline).bold()
                    
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }//: HSTACK
                
                HStack(spacing: 4) {
                    Text("40M")
                        .font(.subheadline).bold()
                    
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }//: HSTACK
            } //: HSTACK
            .padding(.vertical)
            
        } //: VSTACK
        .padding(.horizontal)
    }
    
}


//MARK: - PREVIEW
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
