import SwiftUI

struct ContentView: View {
    let actors = ["Artoria", "Eula","Nian"]
    @State var choiceActor = "Eula"
    @State var membernumber = 1
    let unitprices = [200,300,400]
    @State var unitprice = 200
    @State var tax = 0.15
    @FocusState var taxfocused : Bool
    var totalprice :Double{
        return Double(unitprice)*Double(membernumber)*Double(1+tax)
    }
    var body: some View {
        NavigationView{
        Form{
            Section{
            ForEach(0..<2){
                i in Text("Hello world\(i)")
            }
            }header: {
                Text("Demo")
            }
                Section{
                    Image(choiceActor)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    Picker("Your choice!",selection:$choiceActor){
                        ForEach(actors,id: \.self){
                        actor in Text(actor)
                        }
                    }.pickerStyle(.segmented)
                }header:{
                    HStack{
                    Image(systemName:"person.fill.questionmark")
                          Text("Choose an Actor")
                }
            }
            Section{
                Picker("Number:",selection: $membernumber){
                    ForEach(0..<51){
                        Text("\($0)")
                    }
                }.pickerStyle(.automatic)
                HStack{
                Picker("Unit price",selection: $unitprice){
                    ForEach(unitprices, id: \.self){
                        i in Text("\(i)")
                    }
                }.pickerStyle(.automatic)
                }
                HStack{
                Text("Tax:")
                    TextField("Tax",value:$tax,format:.number).keyboardType(.decimalPad)
                        .focused($taxfocused)
                }
                HStack{
                Text("Total price")
                    Text(totalprice,format: .currency(code: "CAD"))
                }
            }header:{
                HStack{
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Price")
                }
            }
        }
        .navigationTitle("ticket price")
        .toolbar(){
         ToolbarItemGroup(placement: .keyboard){
          Button("Done"){
            taxfocused = false
                    }
            }
            }
    }
    }
}
