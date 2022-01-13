import SwiftUI
struct ContentView: View {
    let lengthunit = ["millimeter","centimeter","decimetre","meter","kilometer"]
    @State var lengthunit1 = "millimeter"
    @State var lengthunit2 = "centimeter"
    @State var number = 1
    var yourresult : Double{
       var transfer = 1
        for i in 0 ... 4 {
            for c in 0 ... 4{
            if lengthunit2==lengthunit[i]&&lengthunit1==lengthunit[c]{
                transfer *= 10*(c-i)
                }
            }
        }
        return Double(number) * Double(transfer)
    }
    var body: some View {
    NavigationView{
        VStack {
            Form{
                Picker("Select the unit ",selection: $lengthunit1){
                    ForEach(lengthunit,id:\.self){
                    whichtowhich in Text(whichtowhich)
                    }
                }
                Picker("Select the length unit transformation",selection: $lengthunit2){
                    ForEach(lengthunit,id:\.self){
                    which in Text(which)
                    }
                }
                Text("The number")
                TextField("Number:",value: $number,format:.number)
                Text("\(yourresult)")
            }
        }
    }.navigationTitle("Unit transformer")
    }
}
