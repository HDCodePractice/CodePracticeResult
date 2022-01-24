import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Image("lanxiang")
                    .resizable()
                    .scaledToFit()
                Text("Lanxiang Vocational School")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
            }
            Text("Prince George")
                .font(.title)
                .fontWeight(.bold)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Image("george")
                .resizable()
                .scaledToFit()
            HStack{
                VStack {
                    Image("barcode")
                        .resizable()
                        .scaledToFit()
                    Text("ID: 09876")
                    Text("专业：挖掘工程")
                }
                Image("QRcode")
                    .resizable()
                    .scaledToFit()
            }
            
            Text("Address: Buckingham Palace")
            Text("✉️:george@lanxiang.com")
            Text("📞: 123456")
            Text("挖掘机技术哪家强?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
            Text("中国山东找蓝翔")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
            
        }
    }
}
