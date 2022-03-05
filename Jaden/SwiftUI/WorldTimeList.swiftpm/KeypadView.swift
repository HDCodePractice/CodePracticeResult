//
//  KeypadView.swift
//  WorldTimeList
//
//  Created by Jaden Cheung on 2/28/22.
//

import SwiftUI

struct KeyPadView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        ScrollView{
            
            ZStack {
                Color(.black)
                VStack {
                    VStack(spacing:0) {
                        VStack{
                            HStack{
                                Text("World Clock")
                                    .bold()
                                    .font(.system(size:40))
                                    .foregroundColor(.white)
                                Spacer()
                                
                            }.padding(30)
                            Divider().background(Color.white)
                        }
                        ForEach(vm.items) { item in
                            HStack (spacing: 60){
                                TimeItemView(time: item.times, hours: item.timeDifference, title: item.name, checker: item.check)
                                
                            }
                        }
                        Spacer()
                    }
                }
            }.ignoresSafeArea()
        }

        
    }
}
