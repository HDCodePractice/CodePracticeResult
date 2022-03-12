
import SwiftUI
import AVKit

struct MyContentView : View {
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View{
        ZStack{
            VStack {
                Text("Play").font(.system(size: 45)).font(.largeTitle)
                HStack {
                    Spacer()
                    Button(action: {
                        audioPlayer.currentTime = 0
                        audioPlayer.rate = 0.5
                        audioPlayer.play()
                    }) {
                        Image(systemName: "play.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action: {
                        audioPlayer.currentTime = 0
                        audioPlayer.rate = 1
                        audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "stop.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
            }
        }
        .onAppear { 
            if let audioURL = Bundle.main.url(forResource: "file", withExtension: "wav"){
                audioPlayer = try! AVAudioPlayer(contentsOf: audioURL)
                audioPlayer.enableRate = true
                audioPlayer.prepareToPlay()
            }
        }
    }
}
