//
//  TweetRowView.swift
//  Twitter Clone
//
//  Created by faishal on 11/05/22.
//

import SwiftUI

struct TweetRowView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    
    //MARK: - BODY
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .top, spacing: 12) {
                // User Avatar
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(uiColor: .systemBlue))
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    // User Info
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    } //: HSTACK
                    
                    // Tweet
                    Text("I beleive in harvey dent.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                } //: VSTACK
                
            } //: HSTACK
            
            // ACTIONS
            HStack {
                Button {
                    // action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button {
                    // action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button {
                    // action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button {
                    // action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            } //: HSTACK
            .padding()
            
            Divider()
            
        } //: VSTACK
        
    }
}

//MARK: - PREVIEW
struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
            .previewLayout(.sizeThatFits)
    }
}
