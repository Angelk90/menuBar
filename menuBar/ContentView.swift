import SwiftUI

struct ContentView: View {
    @ObservedObject var userPreferences = UserPreferences.instance

    var body: some View {
        VStack{
            Text(userPreferences.backgroundIsTransparent ? "Più trasparente" : "Più opaco")
            HStack{
                Spacer()
                Menu {
                    Button(action: {
                        userPreferences.backgroundIsTransparent = false
                    }) {
                        let isSelected = !userPreferences.backgroundIsTransparent
                        SelectableView(title: "Più opaco", isSelected: isSelected)
                    }
                    
                    Button(action: {
                        userPreferences.backgroundIsTransparent = true
                    }) {
                        let isSelected = userPreferences.backgroundIsTransparent
                        SelectableView(title: "Più trasparente", isSelected: isSelected)
                    }

                } label: {
                    Text("Aspetto")
                }
                Spacer()
            }
            .frame(width: 150, height: 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
