//
//  UserStatsView.swift
//  Twitter Clone
//
//  Created by faishal on 12/05/22.
//

import SwiftUI

struct UserStatsView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    
    //MARK: - BODY
    var body: some View {
        
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
        
    }
}

//MARK: - PREVIEW
struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
            .previewLayout(.sizeThatFits)
    }
}
