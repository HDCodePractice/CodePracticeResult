import SwiftUI

struct ContentView: View {
    @State var a = 0
    var body: some View {
        VStack{
            ForEach(0..<7){ y in
                HStack(spacing: 0){
                    ForEach(0..<7){ x in
                        if a == 0{
                            Rectangle()
                                .foregroundColor(.white)
                                .overlay{
                                    Rectangle()
                                        .stroke(.black,lineWidth: 2)
                                } 
                            a = 1
                        }else if a == 1{
                            Rectangle()
                                .foregroundColor(.black)
                                .overlay{
                                    Rectangle()
                                        .stroke(.black,lineWidth: 2)
                                }
                            a = 0
                        }
                        
                            
                    
                    } 
                }
                
            }
        }
    }
}
