//
//  TextAreaView.swift
//  Twitter Clone
//
//  Created by faishal on 13/05/22.
//

import SwiftUI

struct TextAreaView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = UIColor.clear
    }
    
    //MARK: - BODY
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .padding(4)
        } //: ZSTACK
        .font(.body)
        
    }
}

//MARK: - PREVIEW
//struct TextAreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextAreaView()
//            .previewLayout(.sizeThatFits)
//    }
//}
