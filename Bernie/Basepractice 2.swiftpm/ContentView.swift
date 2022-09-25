import SwiftUI

struct ContentView: View {
    @State var Rcount = 5
    @State var Ccount = 5
    
    var body: some View {
        ZStack(alignment: .top){
            Color.clear
            HStack{
                ForEach(1...Ccount,id:\.self){_ in
                    VStack {
                        ForEach(1...Rcount, id:\.self){_ in 
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                        }
                    }
                }
            }
        }
        
        HStack{
            Text("Column:")
            Button("+"){
                if Ccount < 10{
                    Ccount += 1
                }
            }
            .buttonStyle(.borderedProminent)
            Button("-"){
                if Ccount > 1{
                    Ccount -= 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
        HStack{
            Text("Row:")
            Button("+"){
                if Rcount < 10{
                    Rcount += 1
                }
            }
            .buttonStyle(.borderedProminent)
            Button("-"){
                if Rcount > 1{
                    Rcount -= 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

