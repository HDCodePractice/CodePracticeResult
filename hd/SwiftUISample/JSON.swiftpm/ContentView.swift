import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack{
            ForEach(vm.histories){ history in
                HStack{
                    Text(history.date)
                    Text(history.name)
                    ForEach(history.members){member in
                        Text(member.name)
                        Text("\(member.age)")
                    }
                    
                }
            }
            Button{
                vm.addHistory()
            }label: {
                Text("Write")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
