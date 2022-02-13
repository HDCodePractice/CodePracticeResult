import SwiftUI

struct ContentView: View {
    @State var vm = CalculaterModel()
    
    var body: some View {
        VStack {
            ForEach (vm.keyboard,id:\.self){ row in
                HStack(spacing: 10){
                    ForEach (row,id:\.self){ button in
                        Button(
                            buttonTitle: button.title,
                            background: button.background,
                            width: button.width,
                            height: button.height
                        )
                    }
                }
            }
        }
    }
}
