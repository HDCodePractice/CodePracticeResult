import SwiftUI

struct VStackSampleView: View {
    @State var alignment : HorizontalAlignment = .center
    var body: some View {
        VStack{
            VStack(alignment: alignment){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.purple)
                    .frame(width: 50, height: 40)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.mint)
                    .frame(width: 200, height: 40)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .frame(width: 90, height: 40)
            }
            HStack{
                Button("Leading"){
                    withAnimation{
                        alignment  = .leading
                    }
                }.buttonStyle(.borderedProminent)
                Button("Center"){
                    withAnimation{
                        alignment  = .center
                    }
                }.buttonStyle(.borderedProminent)
                Button("Trailing"){
                    withAnimation{
                        alignment  = .trailing
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct VStackSampleView_Previews: PreviewProvider {
    static var previews: some View {
        VStackSampleView()
    }
}
