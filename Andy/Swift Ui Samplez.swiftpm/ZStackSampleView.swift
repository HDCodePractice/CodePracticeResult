import SwiftUI
struct ZStackSampleView: View {
    @State var Alignment : Alignment = .center 
    var body: some View {
        VStack{
        ZStack(alignment: Alignment){
            RoundedRectangle(cornerRadius: 100)
                .fill(.red)
                .frame(width: 240, height: 240)
            RoundedRectangle(cornerRadius: 50)
                .fill(.yellow)
                .frame(width: 160, height: 160)
            RoundedRectangle(cornerRadius: 5)
                .fill(.blue)
                .frame(width: 80, height: 80)
        }
            HStack{
                Button(".topLeading"){
                    withAnimation{
                        Alignment = .topLeading
                    }
                }.buttonStyle(.borderedProminent)
                Button(".top"){
                    withAnimation{
                        Alignment = .top
                    }
                }.buttonStyle(.borderedProminent)
                Button(".topTrailing"){
                    withAnimation{
                        Alignment = .topTrailing 
                    }
                }.buttonStyle(.borderedProminent)
            }
            HStack{
                Button(".leading"){
                    withAnimation{
                        Alignment = .leading
                    }
                }.buttonStyle(.borderedProminent)
                Button(".center"){
                    withAnimation{
                        Alignment = .center
                    }
                }.buttonStyle(.borderedProminent)
                Button(".trailing"){
                    withAnimation{
                        Alignment = .trailing
                    }
                }.buttonStyle(.borderedProminent)
            }
            HStack{
                Button(".bottomLeading"){
                    withAnimation{
                        Alignment = .bottomLeading
                    }
                }.buttonStyle(.borderedProminent)
                Button(".bottom"){
                    withAnimation{
                        Alignment = .bottom
                    }
                }.buttonStyle(.borderedProminent)
                Button(".bottomTrailing"){
                    withAnimation{
                        Alignment = .bottomTrailing
                    }
                }.buttonStyle(.borderedProminent)
        }
        }
    }
}
struct ZStackSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackSampleView()
    }
}
