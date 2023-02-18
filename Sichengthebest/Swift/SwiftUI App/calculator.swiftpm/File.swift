import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct GridListView: View {
    @State var vm = ViewModel()
    @State var selected : Bool = false
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        VStack(spacing:5){
            ForEach(vm.grid, id: \.self){
                row in
                if row == ["q","w","e","r","t","y","u","i","o","p","[","]","\\","del"]{
                    if orientation.isPortrait {
                        Spacer(minLength: 550)
                    }
                }
                HStack(spacing:2){
                    if row == ["z","x","c","v","b","n","m","!\n,","?\n.","/"] {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray)
                            
                            Image(systemName:"arrow.up.square.fill")
                                .foregroundColor(selected ? .blue : .primary)
                                .onTapGesture {
                                    selected.toggle()
                                }
                        }
                    }
                    ForEach(row, id: \.self){
                        letter in
                        GridView(text: letter, text2: letter, selected:selected)
                    }
                }
            }
        }
        .padding(10)
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

struct ViewModel{
    let grid = [
        ["q","w","e","r","t","y","u","i","o","p","[","]","\\","del"],
        ["a","s","d","f","g","h","j","k","l",";","'","return"],
        ["z","x","c","v","b","n","m","!\n,","?\n.","/"],
        ["123","🌎","🎙","space","123","⌨"]
    ]
}



struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(text: "E", text2: "4", selected:false)
    }
}
