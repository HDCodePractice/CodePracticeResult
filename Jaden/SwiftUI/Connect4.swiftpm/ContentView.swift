import SwiftUI

struct ContentView : View {
    @State var vm = ViewModel()

    var body: some View{
        ZStack{
            HStack{
                ForEach(vm.grid,id:\.self){column in
                    ColumnView(column: column)
                }
            }
            .padding(10)
            .background(.gray)
            .cornerRadius(10)
            .padding()
        }
    }
}
struct ColumnView: View {
    @State var column : [GridItem]
    var vm  = ViewModel()
    
    var body: some View {
        VStack{
            ForEach(column){item in
                VStack{
                    ZStack{
                        Image(systemName: item.connect.imageName)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(item.connect.color)
                            .padding(2)
                    }
                    .onTapGesture {
                        column = vm.tapColumn(column: column)
                    }
                }
            }
        }
    }
}

