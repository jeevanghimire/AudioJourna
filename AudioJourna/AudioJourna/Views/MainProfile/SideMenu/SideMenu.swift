import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    @Binding var SelectedTab: Int
    var onOptionSelect: (SideMenuOptionModel) -> Void
    
    @State private var selectionOption: SideMenuOptionModel?
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        
                        VStack {
                            ForEach(SideMenuOptionModel.allCases) { option in
                                Button(action: {
                                    onOptionTab(option)
                                }, label: {
                                    SideMenuRowView(option: option, SelectedOption: $selectionOption)
                                })
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background()
                    
                    Spacer()
                }
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeOut, value: isShowing)
    }
    
    private func onOptionTab(_ option: SideMenuOptionModel) {
        selectionOption = option
        SelectedTab = option.rawValue
        onOptionSelect(option)  // Notify the main view about the selection
        isShowing = false
    }
}

#Preview {
    SideMenu(isShowing: .constant(true), SelectedTab: .constant(0), onOptionSelect: { _ in })
}
