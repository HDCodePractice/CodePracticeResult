import SwiftUI

struct ContentView: View {
    let difficulties = ["Easy"]
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.orange,.yellow], startPoint: .top, endPoint: .bottom)
                VStack {
                    ForEach(difficulties,id: \.self){ difficulty in
                        NavigationLink() {
                            GridView()
                        } label: {
                            ZStack {
                                Text(difficulty)
                                    .font(.title)
                                    .padding()
                            }
                            .frame(width:300)
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(7)
                            .shadow(radius: 5)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .navigationTitle("WordSearch 1.0")
        }
    }
}

struct GridView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: 350, height: 350)
                .foregroundColor(Color(.sRGB, red: 127/255, green: 205/255, blue: 251/255))
                .cornerRadius(50)
            ForEach(vm.grid, id: \.self) { row in
                ForEach(row) { each in
                    Text(each.text)
                }
            }
    
        }
    }
}
