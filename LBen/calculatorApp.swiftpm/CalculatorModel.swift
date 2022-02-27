//
//  File.swift
//  calculatorApp
//
//  Created by Lei Zhou on 2/13/22.
//

import Foundation

struct CalculatorModel {
    let keyboard : [[CalculatorButtonItem]] = [[.command(.clear),.command(.opposite), .command(.percent),.op(.divide)],
                                              [.digit(7),.digit(8),.digit(9),.op(.multiply)],
                                              [.digit(4),.digit(5),.digit(6),.op(.minus)],
                                              [.digit(1),.digit(2),.digit(3),.op(.plus)],
                                        [.digit(0),.dot,.op(.equal)]
    ]
    var output : String = "0"
    var tmpOutput : String = ""
    var tmpOutput2 : String = ""
    var tmpOperator : String = ""
    var opActive : Bool = false
    var count : Int = 0
    
    
    mutating func calculatorStep(inputButton: CalculatorButtonItem) {
        switch inputButton {
        case .digit(_), .dot:
            if (opActive == false) {
                if (tmpOutput == "") {
                    tmpOutput = inputButton.title
                    output = tmpOutput
                }else {
                tmpOutput = tmpOutput + inputButton.title
                output = tmpOutput + inputButton.title
                }
            }else {
                if (tmpOutput2 == "") {
                    tmpOutput2 = inputButton.title
                    output = tmpOutput2
                }else {
                tmpOutput2 = tmpOutput2 + inputButton.title
                output = tmpOutput2 + inputButton.title
                }
            }
        case .command(_):
            switch inputButton.title {
            case "AC":
                if (count >= 1){
                    tmpOutput = ""
                    opActive = false
                    tmpOperator = ""
                    count = 0
                }else{
                    output = "0"
                    count += 1
                }
            case "+/-":
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
            case "%":
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
            default:
                print("nothing to do")
            }
        case .op(_):
            if (opActive == false && inputButton.title != "=") {
                tmpOperator = inputButton.title
                opActive = true
                tmpOutput = output
            }else{
                switch inputButton.title {
                case "+" :
                    output = String(Float(tmpOutput)! + Float(tmpOutput2)!)
                    tmpOutput = output
                    tmpOperator = inputButton.title
                case "-" :
                    output = String(Float(tmpOutput)! - Float(tmpOutput2)!)
                    tmpOutput = output
                    tmpOperator = inputButton.title
                case "x" :
                    output = String(Float(tmpOutput)! * Float(tmpOutput2)!)
                    tmpOutput = output
                    tmpOperator = inputButton.title
                case "÷" :
                    output = String(Float(tmpOutput)! / Float(tmpOutput2)!)
                    tmpOutput = output
                    tmpOperator = inputButton.title
                case "=":
                    switch tmpOperator {
                        case "+" :
                            output = String(Float(tmpOutput)! + Float(tmpOutput2)!)
                            tmpOutput = output
                        case "-" :
                            output = String(Float(tmpOutput)! - Float(tmpOutput2)!)
                            tmpOutput = output
                        case "x" :
                            output = String(Float(tmpOutput)! * Float(tmpOutput2)!)
                            tmpOutput = output
                        case "÷" :
                            output = String(Float(tmpOutput)! / Float(tmpOutput2)!)
                            tmpOutput = output
                        default:
                            print("nothing to do")
                            
                        }
                        tmpOperator = ""
                        opActive = false
                        tmpOutput2 = ""
                default:
                    print("nothing to do")
                    
                }
                tmpOutput2 = ""
                tmpOutput = ""
            }
        }
    }
}
