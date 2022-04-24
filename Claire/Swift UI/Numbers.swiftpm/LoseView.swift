//
//  LoseView.swift
//  Numbers
//
//  Created by Qianji Yao on 2022/4/23.
//

import SwiftUI

struct LoseView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            Text("You Lost!")
                .font(.custom("Gill Sans", size: 60))
                .foregroundColor(.white)
                .shadow(radius: 20, y: 90)
                .offset(y: -60)
        }.ignoresSafeArea()
        
    }
}

struct LoseView_Previews: PreviewProvider {
    static var previews: some View {
        LoseView()
    }
}
