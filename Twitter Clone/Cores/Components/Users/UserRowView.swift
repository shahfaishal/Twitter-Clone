//
//  UserRowView.swift
//  Twitter Clone
//
//  Created by faishal on 12/05/22.
//

import SwiftUI

struct UserRowView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    
    //MARK: - BODY
    var body: some View {
        
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Batman")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Bruce Wayne")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } //: VSTACK
            
            Spacer()
            
        } //: HSTACK
        .padding(.horizontal)
        .padding(.vertical, 4)
        
    }
}

//MARK: - PREVIEW
struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
            .previewLayout(.sizeThatFits)
    }
}
