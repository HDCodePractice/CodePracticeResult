import SwiftUI

struct GridView: View {
    @StateObject var vm = ViewModel() 
    var body: some View {
        VStack {
            ForEach(vm.grid, id: \.self) { row in
                HStack {
                    ForEach(row) { each in
                        Text(each.text)
                            .padding()
                            .background()
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
    }
}
