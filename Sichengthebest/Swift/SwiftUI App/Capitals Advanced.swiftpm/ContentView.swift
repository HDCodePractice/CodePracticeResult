import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State var selection: Int?
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                NavigationLink(tag: 1, selection: $selection) {
                    QuestionView()
                        .environmentObject(vm)
                } label: {
                    Button(){
                        vm.startExam(level: .easy)
                        selection = 1
                    }label: {
                        PrimaryButton("Easy",background: .green)
                    }
                }
                
                NavigationLink(tag: 2, selection: $selection){
                    QuestionView()
                        .environmentObject(vm)
                }label: {
                    Button(){
                        vm.startExam(level: .normal)
                        selection = 2
                    }label: {
                        PrimaryButton("Normal")
                    }
                }
                
                NavigationLink(tag: 3, selection: $selection){
                    QuestionView()
                        .environmentObject(vm)
                }label: {
                    Button(){
                        vm.startExam(level: .hard)
                        selection = 3
                    }label: {
                        PrimaryButton("Hard")
                    }
                }
                
                NavigationLink(tag: 4, selection: $selection){
                    QuestionView()
                        .environmentObject(vm)
                }label: {
                    Button(){
                        vm.startExam(level: .extreme)
                        selection = 4
                    }label: {
                        PrimaryButton("Extreme",background: .red)
                    }
                }
            }
            .padding()
        }
    }
}
