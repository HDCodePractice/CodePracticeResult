import SwiftUI

public struct ContentView: View {
    @State var vm = ViewModle()
    //@State var strResult:String = "0"
    public init(){}
    
    public var body: some View {
        VStack {
            Text(vm.strResult)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .frame( width:270, height: 60)
                .background(Rectangle().fill(.blue).cornerRadius(10))
            
            ForEach (vm.keypad,id:\.self){row in
                HStack{
                    ForEach(row, id:\.self){b in
                        Button(
                            title:b.title,background: b.color,width: b.width,height: b.height)
                            .onTapGesture {
                                print(b.title)
                                vm.onClick(input: b.title)
                            }
                        
                    }
                }
                
            }
        }
    }
}
