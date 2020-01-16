import Foundation
import SwiftUI
import PlaygroundSupport

// 所有键盘的按键定议
enum CalculatorButtonItem {
    // 计算操作s
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    // 数值指令s
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    // 数字
    case digit(Int)
    // 小数点
    case dot
    // 计算操作
    case op(Op)
    // 数值指令
    case command(Command)
}

// 扩展实现Hashable以在SwiftUI内ForEach，同时以响应适配CalculatorButton属性
extension CalculatorButtonItem: Hashable {
    var title:String{
        switch self {
            case .digit(let value): return String(value)
            case .dot: return "."
            case .op(let op): return op.rawValue
            case .command(let command): return command.rawValue
        }
    }
    var backgroundColor:Color{
        switch self {
            case .digit,.dot: return Color.blue
            case .op: return Color.orange
            case .command: return Color.secondary
        }
    }
    var size:CGSize{
        if self == .digit(0){
            // 0按键两倍宽以让整体效果好看
            return CGSize(width: 80*2, height: 80)
        }
        return CGSize(width: 80, height: 80)
    }
}

struct ContentView: View {
    // 使用二维数组定义整体键盘布局顺序
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),
        .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 12){
            Spacer()
            // 显示结果内容
            Text("0")
                .font(.system(size: 76))
                .lineLimit(1) // 限制为一行
                .padding(.trailing,50) // 右边距50
                .frame(
                    minWidth:0,
                    maxWidth: .infinity, //自适应宽度
                    alignment: .trailing //靠右
                )
            VStack(spacing: 8){
                ForEach(pad,id: \.self){ row in
                    CalculatorButtonRow(row: row)
                }
            }.padding(.bottom) // 键盘组合靠下
        }
    }
}

// 键盘整行View,row为一行中要排布的CalculatorButtonItem
struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack{
            ForEach( row,id:\.self ){ item in
                CalculatorButton(title: item.title,backgroundColor: item.backgroundColor, size: item.size, action: {
                    print("tap \(item.title)")
                })
            }
        }
    }
}

// 单个按键View，可以定义显示在按键上的title、按键颜色backgroundColor、大小size和按下的操作action
struct CalculatorButton: View{
    let title: String
    let backgroundColor: Color
    let size:CGSize
    let action: () -> Void
    
    var body: some View{
        Button(action: action){
            Text(title)
                .font(.system(size: 38))
                .foregroundColor(.white)
                .frame(width: size.width,height: size.height)
                .background(backgroundColor)
                .cornerRadius(44)
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
