import SwiftUI

struct ZStackSampleView: View {
    @State var alignment : Alignment = .center
    @State var diceNumber = 1
    var body: some View {
        VStack{
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .padding()
                ZStack(alignment: .bottomTrailing){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 100, height: 100)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(width: 35, height: 35)
                        .padding()
                }
                
            }
            HStack{
                Button("1"){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .frame(width: 100, height: 100)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(width: 35, height: 35)
                }.buttonStyle(.borderedProminent)
                Button("2"){
                    withAnimation{
                        ZStack(alignment: .topLeading){
                        }
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.red)
                            .frame(width: 100, height: 100)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 35, height: 35)
                            .padding()
                        ZStack(alignment: .bottomTrailing){
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.clear)
                                .frame(width: 100, height: 100)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                                .padding()
                        }
                        
                    }
                }.buttonStyle(.borderedProminent)
                Button("3"){
                    withAnimation{
                        alignment  = .topTrailing
                    }
                }.buttonStyle(.borderedProminent)
                Button("4"){
                    withAnimation{
                        alignment  = .topTrailing
                    }
                }.buttonStyle(.borderedProminent)
                Button("5"){
                    withAnimation{
                        alignment  = .topTrailing
                    }
                }.buttonStyle(.borderedProminent)
                Button("6"){
                    withAnimation{
                        alignment  = .topTrailing
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
