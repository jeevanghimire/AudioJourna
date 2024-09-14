

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing:Bool
    var body: some View {
        ZStack{
            if isShowing{
                Rectangle()
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                HStack{
                    VStack(alignment: .leading, spacing: 32){
                        SideMenuHeaderView()
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color.white)
                        
                    Spacer()
                }
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeOut, value:isShowing)
    }
}

#Preview {
    SideMenu(isShowing: .constant(true))
}
