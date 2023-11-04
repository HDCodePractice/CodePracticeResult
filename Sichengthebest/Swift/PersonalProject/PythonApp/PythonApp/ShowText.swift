//
//  ShowText.swift
//  PythonApp
//
//  Created by Sicheng Jiang on 2023-10-28.
//

import Foundation
import SwiftUI

struct TextView: View {
    @Environment(ViewModel.self) var vm
    var body: some View {
        Text(vm.name)
        Image(systemName: vm.type)
    }
}

#Preview {
    TextView()
}
