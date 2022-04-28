import SwiftUI

struct myContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        HStack {
            ForEach(vm.grid,id:\.self) {column in
                ColumnView(column: column)
            }
        }
        .padding(10)
        .background(.gray)
        .cornerRadius(10)
        .padding()
    }
}

struct ColumnView: View {
    @State var column : [GridItem]
    var vm = ViewModel()
    
    var body: some View{
        VStack(spacing:10){
            ForEach(column){item in
                Image(systemName: item.connect.imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(item.connect.color)
                    .padding(2)
            }
        }
        .onTapGesture {
            column = vm.tapColumn(column: column)
        }
    }
}
