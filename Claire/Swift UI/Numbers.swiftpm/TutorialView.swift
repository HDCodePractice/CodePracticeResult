//
//  TutorialView.swift
//  Numbers
//
//  Created by Qianji Yao on 2022/4/13.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
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
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
