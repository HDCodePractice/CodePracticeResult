import SwiftUI

struct ContentView: View {
    @State var image1 = "1"
    @State var image2 = "1"
    @State var image3 = "0"
    @State var image4 = "0"
    @State var image5 = "0"
    @State var playerTotal = 0
    @State var freeze = 0
    @State var aiTotal = 0
    @State var aces = ""
    
    var body: some View {
        VStack {
            Button("New Game"){
                freeze = 0
                aiTotal = 0
                image3 = "0"
                image4 = "0"
                image5 = "0"
                playerTotal = 0
                let randomInt1 = Int.random(in: 1..<14)
                image1 = String(randomInt1)
                if image1 == "11" || image1 == "12" || image1 == "13"{
                    playerTotal += 10
                }else if image1 == "1"{
                    aces = "1"
                    if playerTotal + 11<=21{
                        playerTotal+=11
                    }else{
                        playerTotal+=1
                    }
                    
                }else{
                    playerTotal += randomInt1
                }
                let randomInt2 = Int.random(in: 1..<14)
                image2 = String(randomInt2)
                if image2 == "11" || image2 == "12" || image2 == "13"{
                    playerTotal += 10
                }else if image2 == "1"{
                    aces = "1"
                    if playerTotal + 11<=21{
                        playerTotal+=11
                    }else{
                        playerTotal+=1
                    }
                }else{
                    playerTotal += randomInt2
                }
            }.font(.largeTitle)
            Spacer()
            Button("Freeze"){
                aiTotal = Int.random(in: 17..<26)
                freeze = 1
            }
            HStack{
                Text("Player Amount: \(playerTotal)")
                if freeze == 1{
                    VStack{
                        Text("Ai Amount: \(aiTotal)")
                        Spacer()
                        HStack(){
                            Spacer()
                            if aiTotal > 21{
                                Text("You Win")
                            }else if playerTotal > aiTotal{
                                Text("You Win")
                                    .font(.title)
                            }else if playerTotal == aiTotal{
                                Text("It's a Tie")
                                    .font(.title)
                            }else if aiTotal > playerTotal && aiTotal <= 21{
                                Text("You Lost")
                                    .font(.title)
                            }
                        }
                    }

                    
                }
                if playerTotal > 21{
//                    if aces == "1"{
//                         playerTotal = playerTotal - 10
//                    }
                    Text("You Lost")
                        .font(.title)
                }
                Spacer()
                Button("Draw Card"){
                    if freeze != 1 {
                        if image3 == "0"{
                            let randomInt3 = Int.random(in: 1..<14)
                            image3 = String(randomInt3)
                            if image3 == "11" || image3 == "12" || image3 == "13"{
                                playerTotal += 10
                            }else if image3 == "1"{
                                aces = "1"
                                if playerTotal + 11<=21{
                                    playerTotal+=11
                                }else{
                                    playerTotal+=1
                                }
                            }else{
                                playerTotal += randomInt3
                            }
                        }else if image3 != "0" && image4 == "0"{
                            let randomInt4 = Int.random(in: 1..<14)
                            image4 = String(randomInt4)
                            if image4 == "11" || image4 == "12" || image4 == "13"{
                                playerTotal += 10
                            }else if image4 == "1"{
                                aces = "1"
                                if playerTotal + 11<=21{
                                    playerTotal+=11
                                }else{
                                    playerTotal+=1
                                }
                            }else{
                                playerTotal += randomInt4
                            }
                        }else if image4 != "0" && image5 == "0"{
                            let randomInt5 = Int.random(in: 1..<14)
                            image5 = String(randomInt5)
                            if image5 == "11" || image5 == "12" || image5 == "13"{
                                playerTotal += 10
                            }else if image5 == "1"{
                                aces = "1"
                                if playerTotal + 11<=21{
                                    playerTotal+=11
                                }else{
                                    playerTotal+=1
                                }
                            }else{
                                playerTotal += randomInt5
                            }
                            if playerTotal <= 21{
                                freeze = 1
                                Text("You Win")
                                    .font(.title)
                            }
                        }else{
                            playerTotal = playerTotal
                        }
                    }
                }
            }.font(.title)
                .padding()
            Spacer()
            HStack{
                Image(image1)
                    .resizable()
                    .frame(width: 120, height: 300)
                    .padding()
                Spacer()
                Image(image2)
                    .resizable()
                    .frame(width: 120, height: 300)
                Spacer()
                Image(image3)
                    .resizable()
                    .frame(width: 120, height: 300)
                Spacer()
                Image(image4)
                    .resizable()
                    .frame(width: 120, height: 300)
                Spacer()
                Image(image5)
                    .resizable()
                    .frame(width: 120, height: 300)
                    .padding()
            }.padding()

        }
    }
}
