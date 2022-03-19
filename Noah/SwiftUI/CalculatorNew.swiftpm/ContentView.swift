import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                VStack(spacing:-29) {
                    HStack {
                        Spacer()
                        Text("0")
                            .font(.system(size:60))
                            .foregroundColor(.white)
                    }.padding(50)
                    ForEach(inputOrder, id: \.self) { column in
                        HStack (spacing: 3) {
                            ForEach(column, id: \.self) { row in
                                ButtonView(title: row, background: ["7","8","9","4","5","6","1","2","3","0","."].contains(row) ? .blue : ["÷","×","-","+","="].contains(row) ? .mint : .teal, size: CGSize(width: row == "0" ? 153 : 75, height: 75))
                            }
                        }.padding()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ButtonView: View {
    var title : String
    var background : Color
    var size : CGSize
    
    var body: some View {
        Button() {
            
        } label: {
            Text("\(title)")
                .font(.system(size: size.height/2))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(background)
                .cornerRadius(size.height/2)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "+", background: .yellow, size: CGSize(width: 100, height: 100))
        ButtonView(title: "0", background: .blue, size: CGSize(width: 200, height: 100))
    }
}
