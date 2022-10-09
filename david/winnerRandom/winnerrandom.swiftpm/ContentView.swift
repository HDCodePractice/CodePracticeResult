import SwiftUI

struct ContentView: View {
    @State var input:String = ""
    @State var number:Int = 0
    @State var numbers:[Int]=[]
    @State var result:Int = 0
    
    let buttonArray = [["Reset","Random","Back"],["1","2","3"],["4","5","6"],["7","8","9"],["+/-","0"],["Add","Clear"]]
    
    var body: some View {
        
        VStack {
            ZStack{
                
                RoundedRectangle(cornerRadius: 60)
                    .fill(.pink)
                    .frame(width:200,height:200)
//                    .rotationEffect(90.00)
                    
                
                Text("\(result)")
                    .font(.largeTitle)
                    .bold()
                    .frame(width:190,height:190)
                    
            }
            ZStack{
                RoundedRectangle(cornerRadius: 50)
                    .fill(.mint)
                    .frame(width:400,height:50)
                HStack{
                    
                
                Text("Numbers:")
                if numbers.count > 0{
                    
                    ForEach(0..<numbers.count,id:\.self){num in
                        
                        Text( "\(numbers[num])")
                    }
                }else{
                    
                    HStack{
                        Text("")
                    }
                }
                }
                
                
                
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 50)
                    .fill(.mint)
                    .frame(width:400,height:50)
                Text("Number: \(number)")
            }
            
            
            ForEach(buttonArray,id:\.self){i in
                HStack{
                    ForEach(i,id:\.self){j in
                        Button("\(j)"){
                            if j == "+/-"{
                                number *= -1
                                
                            }else if j == "Add"{
                                numbers.append(number)
                                number = 0
                                
                            }else if j == "Clear"{
                                number = 0
                            }else if let intKey=Int(j){
                                number = number*10 + Int(j)!
                            }else if j=="Reset"{
                                number=0
                                numbers=[]
                            }else if j=="Random"{
                                withAnimation { 
                                    if !numbers.isEmpty{
                                        var index = (0..<numbers.count).randomElement()!
                                        result = numbers[index]
                                    }
                                }
                                
                                
                                //                                numbers = []
                            }else if j=="Back"{
                                numbers.removeLast()
                            }
                            
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            
        }
    }
}
