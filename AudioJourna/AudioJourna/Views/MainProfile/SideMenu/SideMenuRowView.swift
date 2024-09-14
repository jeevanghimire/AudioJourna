//
//  SideMenuRowView.swift
//  AudioJourna
//
//  Created by Jeevan Ghimire on 9/14/24.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var SelectedOption: SideMenuOptionModel?
    
    private var isSelected: Bool{
        return SelectedOption == option
    }
    
    
    var body: some View {
        HStack {
            Image(systemName:option.systemImageName)
                .foregroundStyle(Color.brown)
                .imageScale(.medium)
            
            
            Text(option.title)
                .font(.headline)
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? Color.brown : .primary)
        .frame(height: 44)
        .background(isSelected ? Color.brown.opacity(0.25): .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SideMenuRowView(option: .Home,SelectedOption: .constant(.DashBoard))
}
