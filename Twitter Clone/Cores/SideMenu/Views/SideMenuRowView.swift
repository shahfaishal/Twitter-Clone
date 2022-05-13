//
//  SideMenuRowView.swift
//  Twitter Clone
//
//  Created by faishal on 12/05/22.
//

import SwiftUI

struct SideMenuRowView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    let viewModel: SideMenuViewModel
    
    //MARK: - BODY
    var body: some View {
        
        HStack(spacing: 16) {
            Image(systemName: viewModel.icon)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.title)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        } //: HSTACK
        .frame(height: 40)
        .padding(.horizontal)
        
    }
}

//MARK: - PREVIEW
struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
            .previewLayout(.sizeThatFits)
    }
}
