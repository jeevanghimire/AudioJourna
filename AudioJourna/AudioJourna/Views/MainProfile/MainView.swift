import SwiftUI

struct MainView: View {
    @State private var showMenu = false
    var body: some View {
        NavigationStack{
            
            ZStack {
                
                VStack{
                    Text("Hello")
                    
                }
                SideMenu(isShowing: $showMenu)
            }
            .toolbar(showMenu ? .hidden : .visible , for: .navigationBar)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName:"line.3.horizontal")
                            .bold()
                            .foregroundStyle(.brown)
                        
                    })
                }
            }
            
        }
    }
}

#Preview {
    MainView()
}
