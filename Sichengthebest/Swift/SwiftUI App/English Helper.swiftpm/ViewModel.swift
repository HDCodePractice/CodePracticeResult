//
//  File.swift
//  English Helper
//
//  Created by Sicheng Jiang on 2022-03-12.
//

import SwiftUI

struct Answer: Identifiable{
    let id = UUID()
    var image : String
    var isCorrect: Bool
}

struct ViewModule {
    var question :String
    var answers : [Answer]
}
