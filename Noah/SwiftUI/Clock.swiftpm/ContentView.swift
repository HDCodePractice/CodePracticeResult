import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
    
        NavigationView {
            VStack (alignment: .leading){
                ForEach (vm.items) { item in
                    HStack {
                        VStack {
                            Text(item.timeDifference)
                                .font(.caption)
                            Text(item.name)
                                .font(.body)
                        }
                        Spacer()
                        VStack {
                            Text(item.time)
                        }
                    }.padding(30)
                    Divider()
                }
            }
            .navigationTitle("World Clock")
        }
    }
}
