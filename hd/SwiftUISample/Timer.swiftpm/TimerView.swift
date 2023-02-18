import SwiftUI

struct TimerView: View {
    @State var startDate = Date()
    var body: some View {
        VStack {
            Text(startDate,style: .date)
            Text(startDate,style: .time)
            Text(startDate,style: .timer)
        }
        .onTapGesture {
            startDate = Date()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
