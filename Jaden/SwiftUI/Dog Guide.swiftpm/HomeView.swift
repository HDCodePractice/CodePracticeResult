import SwiftUI

struct HomeView: View {
    @State private var showingTest = false
    @State private var showingGuide = false
    var body: some View {
        VStack{
            if showingTest == false && showingGuide == false{
                Button() {
                    showingTest = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Take Quiz")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Button() {
                    showingGuide = true
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Dog Guide")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
            }
            if showingTest == true{
               TestView()
            }
            if showingGuide == true{
                DogView()
            }

            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

