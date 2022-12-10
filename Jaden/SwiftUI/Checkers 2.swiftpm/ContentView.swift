import SwiftUI

struct ContentView: View {
    @State var a = 0
    var body: some View {
        VStack{
            ForEach(0..<7){ y in
                HStack(spacing: 0){
                    ForEach(0..<7){ x in
                        Rectangle()
                            .foregroundColor(.white)
                            .stroke(.black,lineWidth: 2)
                    
                    } 
                }
                
            }
        }
    }
}
