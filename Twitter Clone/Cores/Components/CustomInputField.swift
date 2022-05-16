//
//  CustomInputField.swift
//  Twitter Clone
//
//  Created by faishal on 16/05/22.
//

import SwiftUI

struct CustomInputField: View {
    
    //MARK: - PROPERTIES AND INITIALIZRES
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(UIColor.darkGray))
                
                TextField(placeholderText, text: $text)
            } //: HSTACK
            
            Divider()
        } //: VSTACK
        
    }
}

//MARK: - PREVIEW
struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", placeholderText: "Email", text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
