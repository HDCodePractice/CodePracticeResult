//
//  WinView.swift
//  Numbers
//
//  Created by Qianji Yao on 2022/4/23.
//

import SwiftUI

struct WinView: View {
    var body: some View {
        LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView()
    }
}
