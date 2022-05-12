//
//  ExploreView.swift
//  Twitter Clone
//
//  Created by faishal on 11/05/22.
//

import SwiftUI

struct ExploreView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    
    //MARK: - BODY
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                ScrollView {
                    
                    LazyVStack {
                        ForEach (0...25, id: \.self) { _ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }
                    } //: VSTACK
                    
                } //: SCROLL VIEW
                
            } //: VSTACK
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            
        } //: NAVIGATION VIEW
        
    }
}

//MARK: - PREVIEW
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
