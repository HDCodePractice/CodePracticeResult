import SwiftUI

struct ContentView: View {
    let num1 = ["1","2","3","4","5","6","7","8"]
    let num2 = ["9","8","7","6","5","4","3","2","1"]
    
    @State var grid = Grid()
    var body: some View {
        ZStack{
            Color.white
            HStack(spacing:0){
                ForEach(0..<9){row in
                    VStack(spacing:0){
                        ForEach(0..<10){column in
                            grid
                            if column == 4{
                                Spacer()
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}
