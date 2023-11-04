//
//  ContentView.swift
//  PythonApp
//
//  Created by Sicheng Jiang on 2023-10-28.
//

import SwiftUI

struct ContentView: View {
    @Bindable var vm = ViewModel()
    
    var body: some View {
        TextField("name", text: $vm.name)
        TextView()
            .environment(vm)
        Button {
            vm.runPython()
        } label: {
            Text("Run Python")
        }
        Text(vm.message)
    }
}

#Preview {
    ContentView()
}
