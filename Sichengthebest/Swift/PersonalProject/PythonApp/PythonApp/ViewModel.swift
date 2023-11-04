//
//  ViewModel.swift
//  PythonApp
//
//  Created by Sicheng Jiang on 2023-10-28.
//

import Foundation
import PythonKit

@Observable class ViewModel {
    var name: String = ""
    var type: String = "bicycle.circle"
    var message: String
    
    init() {
        PythonLibrary.useLibrary(at: "/opt/homebrew/bin/python3")
        let sys = Python.import("sys")
        message = "\(sys.version)\n\(sys.path)"
        sys.path.append("/Users/sichengthebest/Work/CodePracticeResult/Sichengthebest/")
    }
    
    func runPython() {
        let file = Python.import("lalala")
        let response = file.hello()
        message = String(response) ?? ""
    }
}
