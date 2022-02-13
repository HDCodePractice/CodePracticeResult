import SwiftUI

struct ContentView: View {
    @State var cal = Calcu()
    
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(cal.output)
                    .font(.largeTitle)
                 }
        HStack{
            VStack{
                HStack{
                    Image(systemName: "c.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "c"
                        }
                }
                HStack{
                    Image(systemName: "7.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "7"
                        }
                    Image(systemName: "8.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "8"
                        }
                    Image(systemName: "9.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "9"
                        }
                }
                HStack{
                    Image(systemName: "4.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "4"
                        }
                    Image(systemName: "5.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "5"
                        }
                    Image(systemName: "6.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "6"
                        }
                }
                HStack{
                    Image(systemName: "1.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "1"
                        }
                    Image(systemName: "2.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "2"
                        }
                    Image(systemName: "3.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "3"
                        }
                }
                HStack{
                    Image(systemName: "0.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "0"
                        }
                    Image(systemName: "dot.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            cal.input = "."
                        }
                }
                .padding(0)
            }
            VStack{
                Image(systemName: "divide.circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        cal.input = "/"
                    }
                Image(systemName: "multiply.circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        cal.input = "*"
                    }
                Image(systemName: "minus.circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        cal.input = "-"
                    }
                Image(systemName: "plus.circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        cal.input = "+"
                    }
                Image(systemName: "equal.circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        cal.input = "="
                    }
            }
        }
    }
}
        

struct Calcu {
    var N1 : Double = 0
    var N2 : Double = 0
    var opt : String = ""
    var result : Double = 0
    var status :Int = 0
    var output : String = "0"
    var input : String = ""
    var tmpN1 : String = ""
    var tmpN2 : String = ""
    var tmpOpt : String = ""
    var equal : String = "+"
    let allopt = ["+","-","*","/"]
    
//    let numberRows = ["row1", "row2", "row3"]
//    let row1 = [1,2,3]
//    let row2 = [4,5,6]
//    let row3 = [7,8,9]
    
    mutating func inputNumber(input:String){
        if status == 0 {
            tmpN1 += input
            output = tmpN1
        }else{
            tmpN2 += input
            output = tmpN2
        }
    }
    
    mutating func inputOperator(opt:String){
        tmpOpt = input
    }

    mutating func inputAC(inputstring: String){
        output = "0"
    }

    mutating func inputResult(){
        
    }
}
