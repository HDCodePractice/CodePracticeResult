import SwiftUI
//extension String {
//    var expression: NSExpression {
//        return NSExpression(format: self)
//    }
//}

//var formula = "2*3+1.8"
//let timesResult = formula.expression.expressionValue(with: Double(), context: nil) as? Double
//var aaa = timesResult ?? default value

struct ContentView: View {
    @State var name = "AC"
//    var ss1 : String = "(1 + 2 * 3)"
    
//    let expression = NSExpression(format:"5*4-1+3")
//    let value = expression.expressionValue(with: nil, context: nil) as? Int
//    @State var show : String = ""
    
    //let a = (ss1 as NSString).doubleValue
    var body: some View {
        
//        Text(String("\(timesResult!)"))
//        Text(String(Double("\(String(describing: timesResult) )") ?? 0))
        Text(name)
            .onTapGesture {
                name = "C"
            }
        
       
    }

    
//    func aa(ss: String) {
//
//       // var s = " 1 + 9 X 8"
       // ss = ss.replacingOccurrences(of: "X", with: "*")
//        let expn = NSExpression(format:ss)
//        show = "\(expn.expressionValue(with: nil, context: nil) ?? 0)"
//    }
}

