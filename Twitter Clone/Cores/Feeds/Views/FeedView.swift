//
//  FeedView.swift
//  Twitter Clone
//
//  Created by faishal on 11/05/22.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                ForEach(0...20, id: \.self) { _ in
                    TweetRowView()
                        .padding()
                }
            } //: VSTACK
            
        } //: SCROLL VIEW
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
