import SwiftUI

struct ZStackSampleView: View {
    var body: some View {
        VStack{
            HStack{
                Button(".topLeading"){}.buttonStyle(.borderedProminent)
                Button(".topCenter"){}.buttonStyle(.borderedProminent)
                Button(".topTrailing"){}.buttonStyle(.borderedProminent)
            }
            HStack{
                Button(".leading"){}.buttonStyle(.borderedProminent)
                Button(".center"){}.buttonStyle(.borderedProminent)
                Button(".trailing"){}.buttonStyle(.borderedProminent)
            }
            HStack{
                Button(".bottomLeading"){}.buttonStyle(.borderedProminent)
                Button(".bottom"){}.buttonStyle(.borderedProminent)
                Button(".bottomTrailing"){}.buttonStyle(.borderedProminent)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 35, height: 35)
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                VStack{
                    RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 30, height: 30)
                    RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 30, height: 30)
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
