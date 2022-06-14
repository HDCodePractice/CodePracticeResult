import SwiftUI

struct GridView: View {
    @EnvironmentObject var vm : ViewModel
    var body: some View {
        VStack{
            ForEach(vm.grid,id:\.self){line in
                HStack{
                    ForEach(line){item in
                        Text(item.letter)
                            .foregroundColor(item.foregroundColor)
                            .padding()
                            .background(item.backgroundColor)
                            .border(.black)
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(ViewModel())
    }
}
