import SwiftUI
let inputOrder = [["1","2","3","+"],["4","5","6","-"],["7","8","9","×"],["C","0",".","÷"]]
    
    var body: some View {
        VStack(spacing:20){
            HStack{
                Spacer()
            }
            .padding()
            HStack{
                Spacer()
            }
            .padding()
            Spacer()
            VStack{
                ForEach(inputOrder,id:\.self){ row in
                    HStack{
                        ForEach(row,id:\.self){ item in
                                if item == "C" {
                                    fromUnit = "0"
                                    equations = Equations()
                                    equation = Equation()
                                }else if item == "+" || item == "-" || item == "×" || item == "÷"{
                                    if equations.items.count == 0 && equation.operation == ""{
                                        equation.one = fromUnitNumber
                                        equation.operation = item
                                    }else{
                                        equation.two = fromUnitNumber
                                        equations.items.append(equation)
                                        equation = Equation(one: equation.end, operation: item)
                                    }
                                    print(equations)
                                    print(equation)
                                    operators = item
                                    fromUnit = ""
                                }else{
                                    fromUnit += item
                                }
                            }
                        }
                    }
                }
            }
        }
    }
