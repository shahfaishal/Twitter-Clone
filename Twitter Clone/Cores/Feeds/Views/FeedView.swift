//
//  FeedView.swift
//  Twitter Clone
//
//  Created by faishal on 11/05/22.
//

import SwiftUI

struct FeedView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @State private var showNewTweetView: Bool = false
    
    //MARK: - BODY
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                
                VStack {
                    ForEach(0...20, id: \.self) { _ in
                        TweetRowView()
                            .padding()
                    }
                } //: VSTACK
                
            } //: SCROLL VIEW
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("composeTweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .padding()
            }
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        } //: ZSTACK
        
    }
}

//MARK: - PREVIEW
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
