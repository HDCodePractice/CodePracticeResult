import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle().padding(.bottom, 60.0).padding(.top, 40.0).frame(width: 800.0).foregroundColor(Color(hue: 0.046, saturation: 0.39, brightness: 0.999))
            
            Rectangle().padding(.top, 130.0).foregroundColor(Color(hue: 1.0, saturation: 0.221, brightness: 0.971)).frame(width: 800.0, height: 600.0).background(ignoresSafeAreaEdges: .bottom).blendMode(/*@START_MENU_TOKEN@*/.colorBurn/*@END_MENU_TOKEN@*/)
            
            
            VStack {
                Text("Very Epic Name").fontWeight(.black).foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                    .multilineTextAlignment(.trailing)
                    .padding(.leading, 200.0).padding(.bottom, 30.0)
                ZStack {
                    Circle().foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6)).frame(width: 240).padding(.bottom, 350.0)
                    Image("ms.Red").resizable().padding([.leading, .bottom], 30.0).mask(Circle().padding(.bottom, 350.0).frame(width: 220)).clipped(antialiased: true).scaledToFit()
                    VStack {
                        Text("Mr. Red")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hue: 0.014, saturation: 0.962, brightness: 0.7))
                            .multilineTextAlignment(.center)
                            .blur(radius: 0.5)
                        Text("always good")
                            .font(.body)
                            .fontWeight(.thin)
                            .foregroundColor(Color(hue: 0.014, saturation: 0.962, brightness: 0.7))
                            .multilineTextAlignment(.center)
                            .blur(radius: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                        HStack {
                            VStack(alignment: .trailing){
                                Text("Name")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                                    
                                Text("ID")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                                Text("Email")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                                Text("Contact")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                            }
                            .padding(.trailing, 5.0)
                            VStack(alignment: .leading){
                                Text("Reddish 98")
                                    .font(.title2)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                                Text("996230-02")
                                    .font(.title2)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                                Text("mrredepic@let.go")
                                    .font(.title2)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                                Text("summon with milk")
                                    .font(.title2)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                            }
                        }
                        .padding(.top, 25.0)
                    }
                    .padding(.top, 180.0)
                }
                Text("Very Epic Red")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(hue: 0.024, saturation: 0.962, brightness: 0.6))
                    .multilineTextAlignment(.center)
                    .blur(radius: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
            }

        }
    }
}
