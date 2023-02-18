import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        switch vm.views {
        case 1:
            GameView
        case 2:
            WinView
        case 3:
            LoseView
        default:
            TutorialView
        }
    }
    
    var GameView: some View {
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            
            VStack{
                Spacer(minLength: 50)
                VStack{
                    ForEach(vm.grid, id:\.self){ row in
                        HStack{
                            ForEach(row){ item in
                                ZStack{
                                    Rectangle()
                                        .fill(item.status.color)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                        .padding()
                                        
                                    Text("\(item.caption)")
                                        .font(.custom("Gill Sans", size: 30))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    Spacer(minLength: 100)
                    VStack{
                        ForEach(vm.keyPad, id:\.self){ row in
                            HStack(spacing: 5){
                                ForEach(row){ button in
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.white)
                                            .cornerRadius(10)
                                            .shadow(radius: 5)
                                            
                                        Text("\(button.button.title)")
                                            .font(.custom("Gill Sans", size: 30))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                            .onTapGesture{
                                                vm.putNumber(button: button)
                                            }
                                    }
                                }
                            }
                        }
                    }.padding()
                }
                Spacer(minLength: 50)
            }
            
        }
        .ignoresSafeArea()
    }
    
    var LoseView : some View {
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            Text("You Lost!")
                .font(.custom("Gill Sans", size: 60))
                .foregroundColor(.white)
                .shadow(radius: 20, y: 90)
                .offset(y: -60)
            Button {
                vm.views = 1
                vm.inition()
            }label: {
                ZStack{
                    Color.orange
                    Text("Another Game")
                        .font(.custom("Gill Sans", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(width: .infinity)
                .cornerRadius(100)
                .shadow(radius: 5)
            }
            .frame(width: 250, height: 35)
            .offset(y: 360)
        }.ignoresSafeArea()
    }
    
    var TutorialView : some View {
        Group{
            ZStack{
                LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
                Color.white
                    .frame(width: 400, height: 825)
                    .cornerRadius(50)
                Text("Enter a 5 digit number, click “Submit” to submit your answer. The color on the tiles will show how close your answer is.")
                    .font(.custom("Gill Sans", size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 375, height: 75)
                    .offset(x: 0, y: -365)
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 350, height: 10)
                    .offset(x: 0, y: -300)
                Text("If the color on the tile is gray, it means that this letter doesn’t exist in the answer word")
                    .font(.custom("Gill Sans", size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 375, height: 75)
                    .offset(x: 0, y: -265)
                
                
                VStack{
                    HStack(spacing: 25){
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("6")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ==================================
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("7")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ==================================
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("8")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ===================================
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("9")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ===================================
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("0")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                    }
                    .offset(y: -60)
                    
                    Text("If the color on the tile is yellow, it means that this letter exist in the answer, but in the wrong place")
                        .font(.custom("Gill Sans", size: 20))
                        .multilineTextAlignment(.center)
                        .frame(width: 375, height: 75)
                        .offset(x: 0, y: -50)
                    
                    HStack(spacing: 25){
                        ZStack{
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("2")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ==================================
                        ZStack{
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("3")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ==================================
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("9")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ===================================
                        ZStack{
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("1")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ===================================
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("7")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                    }
                    .offset(y: -50)
                    
                    Text("If the color on the tile is green, it means that this letter exist in the answer and also in the right spot")
                        .font(.custom("Gill Sans", size: 20))
                        .multilineTextAlignment(.center)
                        .frame(width: 375, height: 75)
                        .offset(x: 0, y: -50)
                    HStack(spacing: 25){
                        ZStack{
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("1")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ==================================
                        ZStack{
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("2")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ==================================
                        ZStack{
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("4")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ===================================
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("6")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                        // ===================================
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text("7")
                                .font(.custom("Gill Sans", size: 30))
                                .offset(x: 0)
                        }
                    }
                    .offset(y: -50)
                }
               
                Text("You win when all the tiles are green")
                    .font(.custom("Gill Sans", size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 375, height: 75)
                    .offset(x: 0, y: 140)
                HStack(spacing: 25){
                    ZStack{
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        Text("1")
                            .font(.custom("Gill Sans", size: 30))
                            .offset(x: 0)
                    }
                    // ==================================
                    ZStack{
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        Text("2")
                            .font(.custom("Gill Sans", size: 30))
                            .offset(x: 0)
                    }
                    // ==================================
                    ZStack{
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        Text("4")
                            .font(.custom("Gill Sans", size: 30))
                            .offset(x: 0)
                    }
                    // ===================================
                    ZStack{
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        Text("6")
                            .font(.custom("Gill Sans", size: 30))
                            .offset(x: 0)
                    }
                    // ===================================
                    ZStack{
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        Text("7")
                            .font(.custom("Gill Sans", size: 30))
                            .offset(x: 0)
                    }
                }
                .offset(y: 195)
                
                Text("The number of blank words you can put in a row is the number of tries you can have. If you used all your tries, you lose")
                    .font(.custom("Gill Sans", size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 375, height: 75)
                    .offset(x: 0, y: 275)
                Button {
                    vm.views = 1
                    vm.inition()
                }label: {
                    ZStack{
                        Color.white
                        Text("I Understood")
                            .font(.custom("Gill Sans", size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                    .frame(width: .infinity)
                    .cornerRadius(100)
                    .shadow(radius: 5)
                }
                .frame(width: 250, height: 35)
                .offset(y: 360)

        }
    }.ignoresSafeArea()
    }
    
    var WinView : some View {
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            Text("You Won!")
                .font(.custom("Gill Sans", size: 60))
                .foregroundColor(.white)
                .shadow(radius: 20, y: 90)
                .offset(y: -60)
            
            Button {
                vm.views = 1
                vm.inition()
            }label: {
                ZStack{
                    Color.orange
                    Text("Another Game")
                        .font(.custom("Gill Sans", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(width: .infinity)
                .cornerRadius(100)
                .shadow(radius: 5)
            }
            .frame(width: 250, height: 35)
            .offset(y: 360)
        }.ignoresSafeArea()
    }
}



