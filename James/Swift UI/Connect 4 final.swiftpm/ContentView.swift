import SwiftUI

      struct ContentView: View {
          @State var vm = ViewModule()
          var body: some View {
              VStack {
                  HStack{
                      Button("7X8"){
                        var x = 8
                        var y = 7
                  }
                      Button("8X8"){
                        var x = 8
                        var y = 8
                  }
                      Button("9X8"){
                        var x = 9
                        var y = 8
                  }
                  Image("board")
              }
          }
      }
      }


