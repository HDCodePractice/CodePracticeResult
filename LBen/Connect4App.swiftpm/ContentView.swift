import SwiftUI

struct ContentView: View {
    @State var vm = connect4ViewModel()
    var body: some View {
        HStack{
                ForEach (vm.grid, id: \.self){col in
                    ColumnView(columnItem: col)
            }
        }.padding()
            .background(vm.background)
            .cornerRadius(20)
            .padding()
    }
        
}

struct ColumnView: View{
    @State var columnItem : [GridItem]
    @State var vm = connect4ViewModel()
    var body: some View {
        VStack{
            ForEach(columnItem) {
                item in
                Image(systemName: item.connect.image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(item.connect.color)
            }
        }.onTapGesture {
            columnItem =   vm.tapColumn(gridItem: columnItem)
        }
    }
    
}
