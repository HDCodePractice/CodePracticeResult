import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("World Clock")
                    .font(.largeTitle)
                    .bold()
                Divider()
                ForEach(vm.items){ city in
                    ClockView(title: city.name, timeDifference: city.timeDifference,time:city.time,ampm:city.ampm)
                    Divider()
                }
            }
            .padding()
            Spacer()
        }
    }
}
