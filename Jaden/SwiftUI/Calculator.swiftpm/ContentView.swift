import SwiftUI

struct ContentView: View {
    @State var button = 0
    var body: some View {
        VStack {
            VStack{
                HStack{
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink], startPoint: .top, endPoint: .bottom)
                            Text("AC")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 70, height: 70)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                }


                HStack{
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("7")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 70, height: 70)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                }
                HStack{
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("4")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 50, height: 50)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("4")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 50, height: 50)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("4")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 50, height: 50)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("4")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 50, height: 50)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                }
                    
                }
                HStack{
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("1")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 50, height: 50)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("2")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 50, height: 50)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("3")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 50, height: 50)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.red], startPoint: .top, endPoint: .bottom)
                            Text("1")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        
                }
                    .frame(width: 50, height: 50)
                    .cornerRadius(100)
                    .padding()
                    Spacer()
                }
                
                HStack{
 
                    Button{
                        button += 1
                    }label: {
                        ZStack{
                            LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                            Text("0")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                }
                    .frame(width: 200, height: 50)
                    .cornerRadius(100)
                    .padding()
                Spacer()
                    
                }
                

            

            
        }
    }
}
