import SwiftUI

struct MainView: View {
    @State private var showMenu = false
    @State private var selectionTab = 0
    @State private var NavigationSelectionTab: SideMenuOptionModel = .DashBoard

    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectionTab) {
                    ForEach(SideMenuOptionModel.allCases) { option in
                        Text(option.title)
                            .tag(option.rawValue)
                            .onChange(of: selectionTab) { newValue in
                                if let selectedOption = SideMenuOptionModel(rawValue: newValue) {
                                    NavigationSelectionTab = selectedOption
                                }
                            }
                    }
                }

                SideMenu(isShowing: $showMenu, SelectedTab: $selectionTab, onOptionSelect: { option in
                    NavigationSelectionTab = option
                })
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
}

#Preview {
    MainView()
}
