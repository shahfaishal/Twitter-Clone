//
//  AuthHeaderView.swift
//  Twitter Clone
//
//  Created by faishal on 18/05/22.
//

import SwiftUI

struct AuthHeaderView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    let title1: String
    let title2: String
    
    //MARK: - BODY
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack { Spacer() }
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
           
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        } //: VSTACK
        .frame(height: 260)
        .padding(.leading)
        .background(Color(UIColor.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))

        
    }
}

//MARK: - PREVIEW
struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello", title2: "Welcome Back")
            .previewLayout(.sizeThatFits)
    }
}
