//
//  AnswersValueType.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

enum AnswersValueType : Equatable {
    case string
    case number
    case decimal
    case date
    case choice([String])
    case imageChoice([UIImage])
}

extension AnswersValueType {
    init?(_ playgroundValue: PlaygroundValue) {
        switch playgroundValue {
        case .string("string"):
            self = .string
        case .string("number"):
            self = .number
        case .string("decimal"):
            self = .decimal
        case .string("date"):
            self = .date
        case .array(let options):
            // We may have image data ...
            let images = options.compactMap({ (value) -> UIImage? in
                if case .data(let pngData) = value {
                    return UIImage(data: pngData)
                }
                else {
                    return nil
                }
            })
            if images.count > 0 {
                self = .imageChoice(images)
            } else {
                // Or, we may have strings.
                let strings = options.compactMap({ (value) -> String? in
                    if case .string(let string) = value {
                        return string
                    }
                    else {
                        return nil
                    }
                })
                self = .choice(strings)
            }
        default:
            return nil
        }
    }
    
    var playgroundValue: PlaygroundValue {
        switch self {
        case .string:
            return .string("string")
        case .number:
            return .string("number")
        case .decimal:
            return .string("decimal")
        case .date:
            return .string("date")
        case .choice(let options):
            return  .array(options.map({ (string) -> PlaygroundValue in
                return .string(string)
            }))
        case .imageChoice(let images):
            return .array(images.map({ (image) -> PlaygroundValue in
                return .data(image.pngData()!)
            }))
        }
    }
}
