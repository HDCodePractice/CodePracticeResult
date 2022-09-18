import SwiftUI

struct ContentView: View {
    @State var words = ["Burger","Fries","Drink","Hotdog","Sauce"]
    @State var randomX = Double.random(in: 1...1300.0)
    @State var randomY = Double.random(in: 1...80.0)
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.clear
            ForEach(0..<words.count,id:\.self){ i in
//                randomX = Double.random(in: 1...1300.0)
//                randomY = Double.random(in: 1...80.0)
                if randomX >= 1000{
                    Text(words[i])
                        .offset(x: randomX-Double(200*i), y: randomY)
                }else if randomX <= 300{
                    Text(words[i])
                        .offset(x: randomX+Double(200*i), y: randomY)
                }else{
                    Text(words[i])
                        .offset(x: randomX-Double(150*i), y: randomY)
                }
                
            }
            while randomY >= 1575{
                withAnimation{
                    randomY += 10.0
                }
            }
            
            
        }
    }
}
