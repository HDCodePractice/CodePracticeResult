import SwiftUI

struct Button: View {
    
    var title : String = ""
    var background : Color = .red
    var width : CGFloat = 66
    var height : CGFloat = 66
    var calcu = calculate()
    var body: some View{
        Text(title)
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(background)
            .cornerRadius(height/2)
    }
    
}

struct ViewModle{
    var strResult:String = "0"
    var keypad : [[CalculateItem]] = [
        [.command(.clear),.command(.minus),.command(.percent),.op(.divide)],[.digit(7),.digit(8),.digit(9),.op(.mult)],
        [.digit(4),.digit(5),.digit(6),.op(.minus)],
        [.digit(1),.digit(2),.digit(3),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]

    var calcu = calculate()
    mutating func onClick(input: String){
        if input == "+/-" {
            calcu.onMinus()
        }else if input == "%" {
            calcu.onPercent()
        }else if input == "/" || input == "*" || input == "+" || input == "-" {
            calcu.onOper(oper: input)
        }else if input == "AC" {
            calcu.onAC()
        }else if input == "C" {
            calcu.onC()
        }
        else if input == "." {
            calcu.onPoint()
        }else if input == "="{
            calcu.getResult()
        }else {
            calcu.onNum(clickNum: Double(input) ?? 0)
        }
        strResult = calcu.strNum
    }
}
