//
//  File.swift
//  tryagain
//
//  Created by cc on 2022-02-20.
//

import Foundation
//import SwiftUI

struct calculate {
    var currentNum = 0.0    //现在的数字
    var afterPoint = 0.0      //小数点后数字
    var currentEqu = ""     //现有算式
    var currentOpe = ""     //现有运算符
    var isMinus = false     //是否否数
    var isPercent = false   //是否百分数
    var isPoint = false     //是否小数
    var decimal = 0.0        //小数位数
    var strNum = "0"       //显示数字
    var dRes = 0.0          //结果
    var Res = 0.0           //最终结果
    var restart = false
    
    mutating func onAC(){
        currentNum = 0
        afterPoint = 0
        currentEqu = ""
        currentOpe = ""
        isMinus = false
        isPercent = false
        isPoint = false
        strNum = "0"
        decimal = 0
    }
    
    mutating func onOper(oper:String){
        if decimal > 0{
            currentNum = currentNum + afterPoint/decimal
            decimal = 0
        }
        if isMinus{
            currentNum = -currentNum
        }
        strNum = String("\(currentNum)")
        
        isPoint = false
        isMinus = false
        currentOpe = oper
        

        currentEqu = currentEqu + String("\(currentNum)")

        currentNum = 0
        afterPoint = 0
        
    }
    
    mutating func onNum(clickNum:Double){
        if restart {
            currentNum = 0
            restart = false
        }
        if currentOpe != ""{
            currentEqu = currentEqu + currentOpe
            currentOpe = ""
            strNum = String("\(clickNum)")
        }
        if isPercent {
            currentNum = 0
            afterPoint = 0
            decimal = 0
            isPercent = false
        }
        if isPoint {
            if decimal == 0{
                decimal = 10
            }else{
                decimal = decimal * 10
            }
            afterPoint = afterPoint * 10 + clickNum
            dRes = currentNum+afterPoint/decimal
            if afterPoint == 0{
                strNum = String("\(Int(currentNum))")
            }else{
                strNum = String("\(dRes)")
            }
            if clickNum == 0 {
                if afterPoint == 0{
                    var i = decimal
                    strNum = strNum + "."
                    while i/10 >= 1{
                        i = i/10
                        strNum = strNum + "0"
                    }
                }else{
                    var temp = Int(afterPoint)
                    while temp % 10 == 0 {
                        temp = temp/10
                        strNum = strNum + "0"
                    }
                }
                
            }
        }else{
            currentNum = currentNum * 10 + clickNum
            if currentNum == 0{
                strNum = String("\(Int(currentNum))")
            }else{
                strNum = String("\(currentNum)")
            }
        }
        if isMinus {
            strNum = String("-\(strNum)")
        }
    }
    
    mutating func onPercent(){

        if isPoint{
            strNum = String("\(Int(currentNum)).\(Int(afterPoint))")
            currentNum = Double(strNum) ?? 0
            currentNum = currentNum / 100
        }else{
            currentNum = currentNum / 100
        }
        if isMinus {
            strNum = String("-\(currentNum)")
        }else{
            strNum = String("\(currentNum)")
        }
        isPercent = true
        isPoint = false
    }
    
    mutating func onMinus(){
        //currentOpe = ""
        
        if isMinus == true {
            isMinus = false
            if decimal != 0{
                dRes = currentNum+afterPoint/decimal
            }else{
                dRes = currentNum
            }
        }else{
            isMinus = true
            if decimal != 0{
                decimal = -decimal
                dRes = -currentNum+afterPoint/decimal
            }else{
                dRes = -currentNum
            }
        }
        
        strNum = String("\(dRes)")

    }
    
    mutating func onPoint(){
        //currentOpe = ""
        isPoint = true
        if isMinus{
            strNum = String("-\(Int(currentNum)).")
        }else{
            strNum = String("\(Int(currentNum)).")
        }
    }
    
    mutating func onC(){
        currentNum = 0
        strNum = String("\(currentNum)")
    }
    
    mutating func getResult(){
        if currentOpe != ""{
            dRes = Double(currentEqu) ?? 0
            currentEqu = String("\(dRes)" + currentOpe + "\(dRes)")
        }else{
            if decimal > 0{
                dRes = currentNum+afterPoint/decimal
            }else{
                dRes = currentNum
            }
            if isMinus{
                dRes = -dRes
            }
            currentEqu = currentEqu + String("\(dRes)")
        }
  
        let Res = NSExpression(format: currentEqu).expressionValue(with: nil, context: nil) as? Double
        strNum = currentEqu + " = " + String("\(Res!)")
        currentNum = Res!
        currentEqu = ""
        restart = true
        
    }
}
