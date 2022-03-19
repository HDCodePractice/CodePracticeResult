import SwiftUI

struct ContentView: View {
    @State var x = 1
    let items = Array(1...100)
    let layout = [GridItem(.adaptive(minimum: 26))]
    var body: some View {
        ZStack{
            Color.brown
            ScrollView{
                LazyVGrid(columns: layout, content: {
                    ForEach(items, id: \.self) { item in
                        HStack{
                            ZStack{
                                VStack(){
                                    HStack{
                                        Image("2")
                                            .resizable()
                                            .frame(width: 5, height: 5)
                                            .padding()
                                            .onTapGesture {
                                                x = 0
                                            }
                                    }
                                    
                                }
                            }
                        }
                    }

                })
            }
        }.ignoresSafeArea()

    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
