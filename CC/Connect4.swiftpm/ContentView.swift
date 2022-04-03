import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        HStack(spacing:0){
            ForEach (vm.gride,id:\.self) { row in
                columnView(column: row)
            }
        }
        
    }
    
}

struct columnView: View {
    @State var column:[GrideItem]
    var body: some View {
        VStack(spacing:0){
            ForEach (column) {item in
                //grideItemView(item : item)
                Image(systemName:String(item.chess.rawValue))
                    .resizable()
                    .scaledToFit()
            }
        }
        .onTapGesture {
            column = onClick(Column: column)
        }

    }
    
}

func onClick(Column:[GrideItem]) -> [GrideItem]{
    
    var column: [GrideItem]
    var flag:Bool = false
    column = Column
    for i in 0 ... Column.count - 1{
        if Column[i].chess.rawValue != "circle"{
            column[i-1].chess = .white
            flag = true
            return column
        }
    }
    if !flag {
        column[column.count - 1].chess = .black
    }
    return column
}

