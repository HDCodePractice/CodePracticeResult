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
                                .font(.footnote)
                            Text(item.name)
                                .font(.title)
                        }
                        Spacer()
                        VStack {
                            Text(item.time)
                                .font(.title)
                        }
                    }.padding(30)
                    Divider()
                }
            }
            .navigationTitle("World Clock")
        }
    }
}
