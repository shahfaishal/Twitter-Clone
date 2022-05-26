//
//  ProfileView.swift
//  Twitter Clone
//
//  Created by faishal on 11/05/22.
//

import SwiftUI

struct ProfileView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    //MARK: - BODY
    var body: some View {
        
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        } //: VSTACK
        .navigationBarHidden(true)
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
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                }
                
                Image(uiImage: (user.profileImageString.toImage() ?? UIImage(named: "profile")!))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
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
                    .foregroundColor(Color(UIColor.label))
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        } //: HSTACK
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            HStack {
                Text(user.fullName)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(UIColor.systemBlue))
            } //: HSTACK
            
            Text("@\(user.username)")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("Self made, richest and entertaining super hero")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gotham, New York")
                }//: HSTACK
                
                HStack(spacing: 4) {
                    Image(systemName: "link")
                    
                    Text("www.batman.com")
                }//: HSTACK
            } //: HSTACK
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
                .padding(.vertical)
            
        } //: VSTACK
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? Color(UIColor.label) : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3.0)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3.0)
                    }
                } //: VSTACK
                .onTapGesture {
                    withAnimation(.easeOut) {
                        self.selectedFilter = item
                    }
                }
            }
            
        } //: HSTACK
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView {
            
            LazyVStack {
                ForEach(0...9, id: \.self) { _ in
                    TweetRowView()
                        .padding()
                }
            } //: VSTACK
            
        } //: SCROLL VIEW
    }
    
}


//MARK: - PREVIEW
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(fullName: "Bruce Wayne", username: "batman", profileImageString: (UIImage(named: "profile")?.toJpegString(compressionQuality: 1.0))!, email: "www.batman.com"))
    }
}
