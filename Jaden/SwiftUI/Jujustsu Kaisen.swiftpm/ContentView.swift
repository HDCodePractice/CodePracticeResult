import SwiftUI

struct ContentView: View {
    @State var background = "Gojo"
    @State var extra = "1"
    @State var image1 = "ymmt"
    @State var image2 = "1"
    @State var image3 = "1"
    @State var image4 = "1"
    @State var image5 = "1"
    @State var image6 = "1"
    @State var image7 = "1"
    @State var image8 = "1"
    @State var image9 = "1"
    @State var image10 = "1"
    @State var image11 = "1"
    @State var image12 = "1"
    @State var image13 = "1"
    @State var image14 = "1"
    @State var image15 = "1"
    @State var image16 = "1"
    @State var image17 = "1"
    @State var image18 = "1"
    @State var image19 = "1"
    @State var image20 = "1"
    @State var image21 = "1"
    @State var image22 = "1"
    @State var image23 = "1"
    @State var image24 = "1"
  
    var body: some View {
        ZStack {
            Image(background)
                .resizable()
                .frame(width: 700, height: 900)
            VStack{
                Image(extra)
                    .resizable()
                    .frame(width: 30, height: 40)
                Image(extra)
                    .resizable()
                    .frame(width: 30, height: 30)
                Image(image1)
                    .resizable()
                    .frame(width: 30, height: 38)
                Image(image2)
                    .resizable()
                    .frame(width: 30, height: 30)
                Image(image3)
                    .resizable()
                    .frame(width: 30, height: 30)
                HStack{
                    Image(image4)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Image(image5)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Image(image6)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Image(image7)
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack{
                        Image(image8)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Image(image8)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Image(image8)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Image(image8)
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                    }

                    
                }

                Spacer()
            }
        }
    }
}
