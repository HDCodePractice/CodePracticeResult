import SwiftUI

struct StartView: View {
    @EnvironmentObject var vm : ViewModel
    var body: some View {
        VStack{
            Text("Welecom hdcola's Wordle")
                .font(.title)
            Button{
                vm.initGrid()
                vm.gameMode = .gameing
            }label: {
                Text("Start")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(ViewModel())
    }
}
