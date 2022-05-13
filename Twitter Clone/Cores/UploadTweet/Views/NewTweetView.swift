//
//  NewTweetView.swift
//  Twitter Clone
//
//  Created by faishal on 13/05/22.
//

import SwiftUI

struct NewTweetView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @State private var caption: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(UIColor.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("Tweet")
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(Color(UIColor.systemBlue))
                        .clipShape(Capsule())
                }
            } //: HSTACK
            .padding(.horizontal)
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextAreaView("What's happening...", text: $caption)
            } //: HSTACK
            .padding()
            
            Spacer()
        } //: VSTACK
        
    }
}

//MARK: - PREVIEW
struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
