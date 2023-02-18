import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        VStack(spacing:0){
            ForEach(vm.grid,id:\.self){
                row in
                HStack(spacing:0){
                    ForEach(row, id:\.self){
                        item in
                        Image(item.background.name)
                    }
                }
            }
        }
    }
}
