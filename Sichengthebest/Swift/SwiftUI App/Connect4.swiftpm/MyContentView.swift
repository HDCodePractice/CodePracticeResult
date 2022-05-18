import SwiftUI
struct MyContentView : View {
    @State var vm = ViewModel()
    var body: some View{
        HStack{
            ForEach(vm.grid,id:\.self){column in
                ColumnView(column: column)
                    .onTapGesture {
                        vm.tapColumn(column: column)
                    }
            }
        }
        .padding(10)
        .background(.gray)
        .cornerRadius(10)
        .padding()
    }
}

struct ColumnView: View {
    var column : [GridItem]
    
    var body: some View{
        VStack(spacing:10){
            ForEach(column){item in
                ZStack{
                Image(systemName: item.connect.imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(item.connect.color)
                    .padding(2)
                    Text("\(item.column),\(item.row)")
                }
            }
        }
    }
}
