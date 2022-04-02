//
//  File.swift
//  Connect4
//
//  Created by Jaden Cheung on 3/27/22.
//
//
import Foundation
import SwiftUI


enum Connect: String {

    case green
    case black
    case greenWin
    case blackWin
    case nothing

    var color:Color{
        switch self {
        case . green, .greenWin:
            return .green
        case .black, .blackWin:
            return .black
        default:
            return .white
        }
    }

    var imageName:String{
        switch self {
        case . green, .black:
            return "circle.fill"
        case . greenWin, .blackWin:
            return "star.fill"
        default:
            return "circle.fill"
        }
    }
}
