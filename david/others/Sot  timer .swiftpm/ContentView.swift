import SwiftUI

struct ContentView: View {
    let indexes = [0,1,2,3,4,5,6,7]
    let names = ["Chicken","Pork","Snake","Shark","Megalodon","Fish","Trophy Fish","Kraken"]
    let durations = [60,60,60,60,120,40,90,120]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var remainingTime = 0
    
    func getTimeString(time: Int)->String{
        let minutes = time / 60
        let secondsInt = time % 60
        let seconds = secondsInt<10 ? "0\(secondsInt)" : "\(secondsInt)"
        return "\(minutes):\(seconds)"
    }
    var showRemainingTime:String{
        return getTimeString(time: remainingTime)
    }
    
    var body: some View {
        ScrollView{
            VStack {
                Text(showRemainingTime)
                    .font(.largeTitle)
                    .bold()
                    .onReceive(timer) { _ in
                        if remainingTime>0{
                            remainingTime -= 1
                        }
                        
                    }
                
                ForEach(indexes,id:\.self){index in
                    HStack{
                        Text("")
                        
                        Image(names[index])
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        VStack {
                            Text(names[index])
                            Text("\(getTimeString(time:durations[index]))")
                        }
                        
                    }
                    .onTapGesture {
                        remainingTime = durations[index]
                    }
                }
            }
        }
        .padding()
    }
}
