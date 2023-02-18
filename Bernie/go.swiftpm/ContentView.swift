import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        VStack(spacing:0){
            ForEach(vm.grid, id:\.self){row in
                HStack(spacing:0){
                    ForEach (row){item in GridItemView(item: item)
                        
                    }
                }
            }
        }
    }
}

struct GridItemView : View{
    @State var item : GridItem
    var body: some View{
        ZStack{
            Image(item.background.IMG)
                .resizable()
                .scaledToFit()
            Image(systemName: item.go.rawValue)
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .padding(2)
        }
        .onTapGesture{
            item.go = item.go.nextGo
    }
        
        .frame(width: 18, height: 18)
    }
}
