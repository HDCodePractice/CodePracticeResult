import SwiftUI

struct ContentView: View {
    let num1 = ["1","2","3","4","5","6","7","8","9"]
    let num2 = ["9","8","7","6","5","4","3","2","1"]
    
    @State var crossgrid = CrossGrid()
    var body: some View {
        ZStack{
            
            VStack(spacing:0){
                ForEach(0..<8){row in
                    HStack(spacing:0){
                        ForEach(0..<8){column in
                            if row == 0{
                                topGrid()
                            }else{
                                CrossGrid()
                            }
                            
                            
                        }
                    }
                }
                
            }
            
            chuhe()
        }
        .padding(10)
    }
    
}
