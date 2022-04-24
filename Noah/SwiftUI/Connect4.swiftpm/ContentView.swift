import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        ZStack{
            HStack{
                ForEach(vm.grid,id:\.self){column in
                    VStack (spacing: 10){
                        ForEach(column) { item in
                            GridItemView(item: item)
                                .padding(2)
                        }
                        
                    }
                }
            }
            .padding(10)
            .background(.gray)
            .cornerRadius(10)
        }.ignoresSafeArea()
    }
}

struct GridItemView: View {
    @State var item: GridItem
    var body: some View {
        ZStack {
            Image(systemName: item.connect.imageName)
                .resizable()
                .scaledToFit()
            }
        }
        .onTapGesture {
            item.color = item.color.green
        }
    }
}
