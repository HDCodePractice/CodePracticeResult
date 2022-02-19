import SwiftUI



struct ContentView: View {
    let inputOrder = [["AC","+/-","%","÷"],["7","8","9","×"],["4","5","6","-"],["1","2","3","+"],
        ["0",".","="]]
            
    ForEach(inputOrder, id:\.self){
        
    }
    
    ForEach(inputOrder,id:\.self){row in
        
    }
    
    
//                    ZStack{
//                                                    if ["C","+","-","×","÷"].contains(row) {
//                                                        Color.init(red: 0.0, green: 0.0, blue: 250.0)
//                                                    } else {
//                                                        Color.blue
//                                                    }
//                                                    Text("\(row)")
//                                                        .font(.title)
//                                                        .foregroundColor(.white)
//                                                }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}
