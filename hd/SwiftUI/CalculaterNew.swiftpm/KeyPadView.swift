//
//  KeyPadView.swift
//  Calculater
//
//  Created by 老房东 on 2022-02-26.
//

import SwiftUI

struct KeyPadView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing:-29) {
                    HStack {
                        Spacer()
                        Text("0")
                            .font(.system(size:60))
                            .foregroundColor(.white)
                    }.padding(50)
                    ForEach(vm.grid, id: \.self) { column in
                        HStack (spacing: 3) {
                            ForEach(column, id: \.self) { row in
                                ButtonView(title: row, background: ["7","8","9","4","5","6","1","2","3","0","."].contains(row) ? .blue : ["÷","×","-","+","="].contains(row) ? .mint : .teal, size: CGSize(width: row == "0" ? 153 : 75, height: 75))
                            }
                        }.padding()
                    }
                }
            }
        }
        
    }
}

struct KeyPadView_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadView()
    }
}
