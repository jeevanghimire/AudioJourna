import SwiftUI

struct MainView: View {
    @State private var showMenu = false
    @State private var selectionTab = 0
    @State private var NavigationSelectionTab: SideMenuOptionModel = .DashBoard
    @State private var selectedDate: Date = Date()

    var body: some View {
        NavigationStack {
            ZStack {
                // Background color for the entire view, ignoring safe area
                Color(red: 243/255, green: 241/255, blue: 205/255)
                    .ignoresSafeArea()

                if showMenu {
                    // Only show the toolbar when menu is triggered (showMenu = true)
                    SideMenu(isShowing: $showMenu, SelectedTab: $selectionTab, onOptionSelect: { option in
                                        NavigationSelectionTab = option
                                    })
                } else {
                    // Normal view with TabView, Calendar, and other components when showMenu is false
                    VStack {
                        // Welcome and Magnifying Glass
                        
                        HStack {
                            
                            Text("WELCOME")
                                .font(.system(size: 35))
                                .padding(.leading)
                                .fontWeight(.heavy)

                            Spacer()

                            NavigationLink(destination: TagSearch()){
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 35))
                                    .foregroundStyle(Color.brown)
                            }
                            .padding(.trailing)
                        }
                        .padding(.top)

                        Spacer()

                        // CalendarView integrated here
                        CalendarGridView(selectedDate: $selectedDate)
                            .padding(.bottom)
                        Spacer(minLength: 320)
                    }
                }
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle(NavigationSelectionTab.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .bold()
                            .foregroundStyle(.brown)
                    })
                }
            }
        }
    }

    // Sample method for tag search
    func tagSearch() {
        print("Tag search triggered")
    }
}

#Preview {
    MainView()
}
