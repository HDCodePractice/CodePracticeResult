import SwiftUI


struct ContentView: View {
    @State var kb = KeyboardComponent()
    var body: some View {
        VStack(spacing:0){
            Rectangle().hidden()
            Rectangle().hidden()
            Rectangle().hidden()
            Rectangle().hidden()
            Rectangle().hidden()
            Rectangle().hidden()
            Rectangle().fill(.gray)
            ForEach(kb.keys,id: \.self)
                { i in
                    HStack(spacing:0){
                        ForEach(i,id: \.self)
                            { k in
                                ZStack{
                                    Button(buttonTitle: k, buttonSubTitle: k, width: .infinity,height: .infinity)
                                }
                           }
                    }
               }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}




