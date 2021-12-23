import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            Text("Student ID")
                .font(.largeTitle)
                .foregroundColor(Color(hue: 0.556, saturation: 0.795, brightness: 0.859))
                
                
            Image("MyHead")
            Text("Claire Yao")
                .font(.title)
            Text("Pickering College, Grade 7")
                .multilineTextAlignment(.leading)
            HStack{
                Text("Code:          ")
                Image("BarCode")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 200.0)
            }
        }
        
//        HStack{
//            Image("MyHead")
//                .resizable()
//                .frame(width: 100.0, height: 100.0)
//                .scaledToFit()
//            VStack{
//                Text("Hello, world!")
//                    .font(.title)
//                    .foregroundColor(Color.blue)
//                Text("Hello, Claire!")
//                    .foregroundColor(Color.red)
//            }
//        }
    }
}
