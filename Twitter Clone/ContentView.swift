//
//  ContentView.swift
//  Twitter Clone
//
//  Created by faishal on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES AND INTITALIZERS
    @State private var showMenu: Bool = false
    @EnvironmentObject var authViewModel : AuthViewModel
    
    //MARK: - BODY
    var body: some View {
        
        Group {
            if authViewModel.userSession == nil {
                //NO USER LOGGED IN
                LoginView()
            } else {
                //HAVE A LOGGED IN USER
                mainInterfaceView
            }
        } //: GROUP
        
    }
}


//MARK: - EXTENSION
extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color(UIColor.black)
                        .opacity(showMenu ? 0.25 : 0)
                } //: ZSTACK
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.easeOut(duration: 0.5)) {
                        showMenu = false
                    }
                }
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color(UIColor.systemBackground) : Color.clear)
        } //: ZSTACK
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = authViewModel.currentUser {
                    Button {
                        withAnimation(.easeIn(duration: 0.5)) {
                            showMenu.toggle()
                        }
                    } label: {
                        Image(uiImage: (user.profileImageString.toImage() ?? UIImage(named: "profile")!))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
    
}


//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
