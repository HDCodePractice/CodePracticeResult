import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Image("lanxiang")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("Lanxiang Vocational School")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
            }
            Text("Prince George")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            Image("george")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay{Circle().stroke(.yellow, lineWidth:4)}
                .shadow(radius: 7)
            HStack{
                VStack {
                    Image("barcode")
                        .resizable()
                        .scaledToFit()
                        .background(Color.white)
                    Text("ID: 09876")
                    Text("专业：挖掘工程")
                }
                Image("QRcode")
                    .resizable()
                    .scaledToFit()
                    .background(Color.white)
            }
            
            Text("Address: Buckingham Palace \("\n") ✉️:george@lanxiang.com \("\n") 📞: 123456")
                .frame(alignment: .leading)
//            Text("✉️:george@lanxiang.com")
//            Text("📞: 123456")
            Text("挖掘机技术哪家强?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .padding([.top, .leading, .trailing])
            Text("中国山东找蓝翔")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .padding([.leading, .bottom, .trailing])
            
        }
    }
}
