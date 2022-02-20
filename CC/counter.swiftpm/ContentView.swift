import SwiftUI

struct ContentView: View {

    let strColor = Color(.sRGB, red:0.43 , green:0.57, blue: 0.31)
    let arrright = ["*", "-", "+"]
    let arrtop = ["AC", "+/-", "%", "/"]
    let calcu = calculate()
    @State var strResult:String = "0"
    
    var body: some View {
        VStack {
            Text(strResult)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .frame( width:270, height: 40)
                .background(Rectangle().fill(strColor).cornerRadius(10))

            HStack{
                ForEach(0..<4) {n in
                    Text("\(String(arrtop[n]))")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(20)
                        .frame(width:60, height: 60)
                        .background(Circle().fill(strColor))
                        .minimumScaleFactor(0.1)
                        .onTapGesture {
                            onClick(input: String(arrtop[n]))
                        }
                }
            }
            ForEach(0..<3) { l in
                HStack{
                    ForEach(1..<5) { i in

                        if (i < 4) {
                            Text("\(i+l*3)")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(20)
                                .frame(width:60)
                                .background(Circle().fill(strColor))
                                .onTapGesture {
                                    calcu.onNum(clickNum: Double((i+l*3)))
                                    strResult = calcu.strNum
                                }
                        }else {
                            Text("\(String(arrright[l]))")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(20)
                                .frame(width: 60)
                                .background(Circle().fill(strColor))
                                .onTapGesture {
                                    onClick(input: "\(String(arrright[l]))")
                                }
                        }
                       
                    }
                }
            }
            HStack{
                
                Text("0")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(20)
                    .frame(width:120)
                    .background(Rectangle().fill(strColor).cornerRadius(30))
                    .onTapGesture{
                        calcu.onNum(clickNum: 0)
                        onClick(input: "0")
                    }
                Text(".")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(20)
                    .frame(width:60)
                    .background(Circle().fill(strColor))
                    .onTapGesture{onClick(input: ".")}
                Text("=")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(20)
                    .frame(width:60)
                    .background(Circle().fill(strColor))
                    .onTapGesture{
                        calcu.getResult()
                        strResult = calcu.strNum
                    }
            }
        }
    }
    
    func onClick(input: String){

        if input == "+/-" {
            calcu.onMinus()
            strResult = calcu.strNum
        }else if input == "%" {
            calcu.onPercent()
        }else if input == "/" || input == "*" || input == "+" || input == "-" {
            calcu.onOper(oper: input)
            //strResult = calcu.currentEqu
            //return
        }
        
        if input == "AC" {
            calcu.onAC()
            
        }else if input == "C" {
            calcu.onC()
            
        }
        else if input == "." {
            calcu.onPoint()
        }
        strResult = calcu.strNum
    }
   
}

class calculate {
    var currentNum = 0.0    //现在的数字
    //var clickNum = 0.0        //点击数字
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
    
    func onAC(){
        currentNum = 0
        //clickNum = 0
        afterPoint = 0
        currentEqu = ""
        currentOpe = ""
        isMinus = false
        isPercent = false
        isPoint = false
        strNum = "0"
        decimal = 0
    }
    
    func onOper(oper:String){
        if decimal > 0{
            //strNum = String("\(Int(currentNum)).\(Int(afterPoint))")
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
        
//        if isMinus{
//            if currentNum > 0 {
//                currentEqu = currentEqu + String("(-\(currentNum))")
//            }else{
//                currentEqu = currentEqu + String("\(currentNum)")
//            }
//            isMinus = false
//        }else{
            currentEqu = currentEqu + String("\(currentNum)")
//        }
//        if oper == "+" || oper == "-" {
//            getResult()
//        }
        currentNum = 0
        afterPoint = 0
        
    }
    
    func onNum(clickNum:Double){
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
    
    func onPercent(){
        //currentOpe = ""
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
    
    func onMinus(){
        //currentOpe = ""
        isMinus = true
        currentNum = -currentNum
        //decimal = -decimal
        if decimal != 0{
            decimal = -decimal
            dRes = currentNum+afterPoint/decimal
        }else{
            dRes = currentNum
        }
        
        strNum = String("\(dRes)")
//        if currentNum > 0 {
//            currentNum = -currentNum
//            if afterPoint > 0 {
//                dRes = currentNum+afterPoint/decimal
//                strNum = String("\(dRes)")
//                //strNum = String("\(Int(currentNum)).\(Int(afterPoint))")
//            }else{
//                strNum = String("\(currentNum)")
//            }
//        }else if currentNum == 0 {
//            if afterPoint > 0 {
//                strNum = String("-\(Int(currentNum)).\(Int(afterPoint))")
//            }else{
//                strNum = String("-\(currentNum)")
//            }
//        }
    }
    func onPoint(){
        //currentOpe = ""
        isPoint = true
        if isMinus{
            strNum = String("-\(Int(currentNum)).")
        }else{
            strNum = String("\(Int(currentNum)).")
        }
    }
    
    func onC(){
        currentNum = 0
        strNum = String("\(currentNum)")
    }
    
    func getResult(){
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
        //currentEqu = "(" + currentEqu + ")"
        //strNum = currentEqu
        
        let Res = NSExpression(format: currentEqu).expressionValue(with: nil, context: nil) as? Double
        strNum = currentEqu + " = " + String("\(Res!)")
        currentNum = Res!
        currentEqu = ""
        restart = true
        
    }

}

