import SwiftUI

struct ClassNotesView: View {
    @State var count = 5
    @State var isSwitch = true
    
    var grid : some View{
        ForEach( 0..<count , id: \.self) { _ in
            VStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
        }
    }
    
    var body: some View {
        VStack {
            ZStack{
                Color.clear
                if isSwitch{
                    VStack{
                        grid
                    }
                }else{
                    HStack{
                        grid
                    }
                }
            }
            
            HStack{
                Button("+"){
                    if count < 10{
                        count += 1
                    }
                }.buttonStyle(.borderedProminent)
                
                Button("Switch"){
                    withAnimation { 
                        isSwitch.toggle()
                    }
                }.buttonStyle(.borderedProminent)
                
                Button("-"){
                    if count > 1{
                        count -= 1
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}
