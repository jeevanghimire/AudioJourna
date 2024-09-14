//
//  SideMenuHeaderView.swift
//  AudioJourna
//
//  Created by Jeevan Ghimire on 9/14/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack{
            Image(systemName:"person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 48,height: 48)
                .background(.brown)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            VStack(alignment: .leading,spacing: 6){
                     Text("User Name")
                    .font(.subheadline)
                Text("test@test.com")
                    .font(.footnote)
                    .tint(.gray)
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
