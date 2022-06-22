import SwiftUI

struct EndView: View {
    @EnvironmentObject var vm : ViewModel
    var body: some View {
        VStack{
            Text("Your score is: \(vm.rightCount)")
            PrimaryButton("Restart")
                .onTapGesture {
                    vm.startExam(level: vm.level)
                }
        }
        .padding()
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ViewModel()
        vm.startExam(level: .easy)
        vm.reachEnded = true
        vm.rightCount = 5
        return EndView()
            .environmentObject(vm)
    }
}
