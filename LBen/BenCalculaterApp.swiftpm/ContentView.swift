import SwiftUI

struct ContentView: View {
    @State var cal = Calculater()
    let columns = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    var body: some View {
        VStack(alignment: .trailing) {
            Text(cal.output).font(.largeTitle)
        }
        VStack {
            HStack{
                Button(action:{
                    cal.resetCalculate(inputString: cal.resetSymbol)
                }) {
                    Text(cal.resetSymbol)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.black)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                Button(action:{
                    _ = cal.switchNumber()
                }) {
                    Text(cal.functionSymbol)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.black)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                Button(action:{
                    _ = cal.percentNumber()
                }) {
                    Text(cal.percentSymbol)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.black)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
            }
            HStack {
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(cal.numbers,id: \.self) { number in
                            Button(action:
                                    {
                                _ = cal.displayNumber(inputString: number)
                            }
                            ) {
                                Text(number)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color.black)
                                    .background(Color.gray)
                                    .clipShape(Circle())
                            }.buttonStyle(PlainButtonStyle())
                            
                        }
                    Button(action:
                            {
                       _ = cal.calculateResult()
                    }
                    ) {
                        Text(cal.calculateSymbol)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }.buttonStyle(PlainButtonStyle())
                    }
                VStack {
                    ForEach(cal.operationSymbol,id: \.self) { opSymbol in
                        
                        Button(action:
                                {
                            _ = cal.operateStep(operatorString: opSymbol)
                        }
                        ) {
                            Text(opSymbol)
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color.gray)
                                .clipShape(Circle())
                        }.buttonStyle(PlainButtonStyle())
                        
                    }
                }
            }
        }
    }
}
struct Calculater {
    var numbers : [String] = ["7","8","9","4","5","6","1","2","3","0","."]
    var operationSymbol : [String] = [ "*", "/","+","-"]
    var history : String = ""
    var output : String = "0"
    var tmpOutput : String = ""
    var tmpOutput2 : String = ""
    var tmpOperator : String = ""
    var percentSymbol : String = "%"
    var functionSymbol : String = "+/-"
    var resetSymbol : String = "C"
    var calculateSymbol = "="
    var opActive : Bool = false
    var count : Int = 0

    
    mutating func displayNumber(inputString : String) -> String {
        if (opActive == false) {
            if (tmpOutput == "") {
                tmpOutput = inputString
                output = tmpOutput
            }else {
            tmpOutput = tmpOutput + inputString
            output = tmpOutput + inputString
            }
        }
        else {
            if (tmpOutput2 == "") {
                tmpOutput2 = inputString
                output = tmpOutput2
            }else {
            tmpOutput2 = tmpOutput2 + inputString
            output = tmpOutput2 + inputString
            }
        }
        return output
    }
    
    mutating func switchNumber() -> String {
        if output.contains("-"){
            output = output.replacingOccurrences(of: "-", with: "")
        } else {
            if output != "0" {
                output = "-" + output
            }
        }
        if (opActive == true){
            tmpOutput2 = output
        }else{
            tmpOutput = output
        }
        return output
    }
    
    mutating func resetCalculate(inputString:String) {
        if (count >= 1){
            tmpOutput = ""
            opActive = false
            tmpOperator = ""
            count = 0
        }else{
            output = "0"
            count += 1
        }
        
    }
        
    mutating func calculateResult() -> String {
        switch tmpOperator {
        case "+" :
            output = String(Float(tmpOutput)! + Float(tmpOutput2)!)
            tmpOutput = output
        case "-" :
            output = String(Float(tmpOutput)! - Float(tmpOutput2)!)
            tmpOutput = output
        case "*" :
            output = String(Float(tmpOutput)! * Float(tmpOutput2)!)
            tmpOutput = output
        case "/" :
            output = String(Float(tmpOutput)! / Float(tmpOutput2)!)
            tmpOutput = output
        default:
            print("nothing to do")
            
        }
        tmpOperator = ""
        opActive = false
        tmpOutput2 = ""
        return output
    }
    
    mutating func percentNumber() -> String {
        output = String(Float(output)!/100)
        if (opActive == true){
            tmpOutput2 = output
        }else{
            tmpOutput = output
        }
        if (opActive == true){
            tmpOutput2 = output
        }else{
            tmpOutput = output
        }
        return output
    }
    
    mutating func operateStep(operatorString : String) -> String {
        if (opActive == false) {
            tmpOperator = operatorString
            opActive = true
            tmpOutput = output
        }else{
            switch tmpOperator {
            case "+" :
                output = String(Float(tmpOutput)! + Float(tmpOutput2)!)
                tmpOutput = output
                tmpOperator = operatorString
            case "-" :
                output = String(Float(tmpOutput)! - Float(tmpOutput2)!)
                tmpOutput = output
                tmpOperator = operatorString
            case "*" :
                output = String(Float(tmpOutput)! * Float(tmpOutput2)!)
                tmpOutput = output
                tmpOperator = operatorString
            case "/" :
                output = String(Float(tmpOutput)! / Float(tmpOutput2)!)
                tmpOutput = output
                tmpOperator = operatorString
            default:
                print("nothing to do")
                
            }
            tmpOutput2 = ""
        }
        return output
    }
}
