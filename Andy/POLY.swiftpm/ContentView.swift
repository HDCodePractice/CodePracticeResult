import SwiftUI

struct ContentView: View {
    @State var color : [[Color]] = [[.red,.yellow],[.orange,.green],[.orange,.green],[.clear,.clear],[.orange,.green],[.clear,.clear],[.purple,.clear],[.purple,.blue],[.clear,.clear],[.purple,.blue],[.brown,.cyan]]
    var body: some View {
        ZStack{
            VStack(spacing:3){
                ForEach(1...11,id:\.self){ _ in
                    HStack(spacing:3){
                        ForEach(1...11,id:\.self){ _ in
                            Rectangle()
                        }
                    }
                }
            }
            VStack(spacing:3){
                ForEach(0..<11,id:\.self){ i in
                    HStack(spacing:3){
                        Rectangle()
                            .fill(color[i][0])
                            .frame(width: 270)
                        Rectangle()
                            .fill(color[i][1])
                            .frame(width: 260)
                            
                    }
                }
                
            }.fra
            
            Rectangle()
                .padding(80)
        }
    }
}
