import SwiftUI

struct ContentView: View {

    @State var xy = Array(repeating: [0.0,0.0], count: 10)
//    @State var xy = [[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0]]
    @State var colors:[Color]=[.cyan,.mint,.pink,.yellow,.orange,.blue,.gray,.green]
    @State var colorNum = 0
    var body: some View {
        VStack {
            ZStack{
                Color.clear
                ForEach(1..<10,id:\.self){num in
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.brown)
                        .offset(x:xy[num][0],y:xy[num][1])
                }
            }
            HStack{
                Button("Start"){
                    withAnimation(.easeIn(duration: 0.5)) { 
                        for i in 0..<xy.count{
                            xy[i][0] = Double.random(in:-200...200)
                            xy[i][1] = Double.random(in:-300...300)
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                Button("Renew"){
                    withAnimation (.easeIn(duration: 0.6)){ 
                        xy = [[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0]]
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}
