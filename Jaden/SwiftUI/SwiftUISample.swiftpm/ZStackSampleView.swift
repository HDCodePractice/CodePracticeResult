import SwiftUI

struct ZStackSampleView: View {
    @State var alignment : HorizontalAlignment = .center
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.orange)
                    .frame(width: 70, height: 70)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.yellow)
                    .frame(width: 35, height: 35)
            }
            VStack{
                HStack{
                    Button("Top Leading"){

                    }.buttonStyle(.borderedProminent)
                    Button("Top Center"){

                    }.buttonStyle(.borderedProminent)
                    Button("Top Trailing"){

                    }.buttonStyle(.borderedProminent)
                }
                HStack{
                    Button("Leading"){
                        
                    }.buttonStyle(.borderedProminent)
                    Button("Center"){

                    }.buttonStyle(.borderedProminent)
                    Button("Trailing"){

                    }.buttonStyle(.borderedProminent)
                }
                HStack{
                    Button("Bottom Leading"){

                    }.buttonStyle(.borderedProminent)
                    Button("Bottom Center"){

                    }.buttonStyle(.borderedProminent)
                    Button("BottomTrailing"){

                    }.buttonStyle(.borderedProminent)
                }

            }
        }
    }
}

struct ZStackSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackSampleView()
    }
}
