//
//  SideMenuView.swift
//  Twitter Clone
//
//  Created by faishal on 12/05/22.
//

import SwiftUI

struct SideMenuView: View {
    
    //MARK: - PROPERTIES AND INITIALIZERS
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                    
                    Text("@batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
                
            } //: VSTACK
            
        } //: VSTACK
        
    }
}

//MARK: - PREVIEW
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
