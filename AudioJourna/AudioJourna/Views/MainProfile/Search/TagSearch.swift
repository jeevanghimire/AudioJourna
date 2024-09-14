
import SwiftUI

struct TagSearch: View {
    @State private var SearchTag = " "
    var body: some View {
        
        ZStack{
            Color(red: 243/255, green: 241/255, blue: 205/255)
                .ignoresSafeArea()
            
            NavigationStack{
                Text("Hello World")
                
            }
            .navigationTitle("Search")
            .searchable(text: $SearchTag,prompt: "Search Tag")
        }
    }
}

//Make function to recieve the Tag from another view that we stored


#Preview {
    TagSearch()
}
