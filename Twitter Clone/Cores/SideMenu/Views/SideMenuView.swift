//
//  SideMenuView.swift
//  Twitter Clone
//
//  Created by faishal on 12/05/22.
//

import SwiftUI

struct SideMenuView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @EnvironmentObject var authViewModel: AuthViewModel
    
    //MARK: - BODY
    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading) {
                    Image(uiImage: (user.profileImageString.toImage() ?? UIImage(named: "profile")!))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullName)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                    
                } //: VSTACK
                .padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { item in
                    switch item {
                    case .profile:
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuRowView(viewModel: item)
                        }
                        
                    case .lists:
                        NavigationLink {
                            
                        } label: {
                            SideMenuRowView(viewModel: item)
                        }
                        
                    case .bookmarks:
                        NavigationLink {
                            
                        } label: {
                            SideMenuRowView(viewModel: item)
                        }
                        
                    case .logout:
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SideMenuRowView(viewModel: item)
                        }
                    }
                }
                
                Spacer()
                
            } //: VSTACK
        }
        
    }
}

//MARK: - PREVIEW
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
