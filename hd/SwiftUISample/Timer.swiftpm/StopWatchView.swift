import SwiftUI
import AVKit

struct StopWatchView: View {
    let timers = [2,60,120,180,240,250]
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    @State var timeLeft = 0
    @State var audioPlayer: AVAudioPlayer!
    
    func getTimeString(_ time: Int)->String{
        let minutes = time / 60
        let secondsInt = time % 60
        let seconds = secondsInt<10 ? "0\(secondsInt)" : "\(secondsInt)"
        return "\(minutes):\(seconds)"
    }
    
    var body: some View {
        VStack {
            Text("\(getTimeString(timeLeft))")
                .onReceive(timer) { _ in
                    if timeLeft > 0 {
                        timeLeft -= 1
                        if timeLeft == 0 {
                            if let audioPlayer=audioPlayer{
                                audioPlayer.play()
                            }else if let path=Bundle.main.path(forResource: "ding.mp3", ofType: nil){
                                let url = URL(fileURLWithPath: path)
                                do{
                                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                                    audioPlayer.play()
                                }catch{
                                    print("can't load audio file")
                                }
                            }
                        }
                    }
                }
            
            HStack{
                ForEach(timers,id:\.self){ t in
                    Text("\(getTimeString(t))")
                        .onTapGesture {
                            timeLeft = t
                        }
                }
            }
        }
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
