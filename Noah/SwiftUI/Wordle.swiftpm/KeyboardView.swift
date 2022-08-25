import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        VStack{
            ForEach(vm.keyboard,id:\.self){ line in
                HStack{
                    ForEach(line,id:\.self){ kb in
                        Text(kb.letter)
                            .foregroundColor(.black)
                            .padding()
                            .background(kb.color.background)
                            .cornerRadius(10)
                            .onTapGesture {
                                vm.tapButton(button: kb)
                            }
                        
                    }
                }
            }
        }
        
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            KeyboardView()
                .environmentObject(ViewModel())
        }
    }
}
