//
//  AnswersLiveView.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

public func setupLiveView() {
    PlaygroundPage.current.liveView = {
        let answersViewController = AnswersViewController()
         return answersViewController
    }()
}

// MARK: LiveView Client

class AnswersLiveViewClient : PlaygroundRemoteLiveViewProxyDelegate  {
    var responses: [String] = []
    
    init() {
    }
    
    func show<T>(_ thing: T) {
        guard Thread.isMainThread else {
            DispatchQueue.main.sync { [unowned self] in
                self.show(thing)
            }
            return
        }
        
        guard let liveViewMessageHandler = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
            return
        }

        switch thing {
        case let string as String:
            liveViewMessageHandler.send(AnswersCommand.show(string))
        case let image as UIImage:
            liveViewMessageHandler.send(AnswersCommand.showImage(image))
        default:
            assertionFailure("unknown type")
        }

        let delay: TimeInterval = UIAccessibility.isVoiceOverRunning ? 4.0 : AnswersViewController.insertAnimationDuration / 2.0
        RunLoop.main.run(until: Date(timeIntervalSinceNow: delay))
    }

    func ask(forType valueType: AnswersValueType, placeholder: String) -> String {
        return waitForResponse(AnswersCommand.ask(valueType, placeholder))
    }

    func ask(forType valueType: AnswersValueType, placeholder: String) -> Image {
        return waitForImage(AnswersCommand.ask(valueType, placeholder))
    }

    func pauseUntilTapped(message: String) {
        var validated = message
        if message.isEmpty {
            validated = NSLocalizedString("Tap to Continue", comment: "title of a button")
        }
        _ = waitForResponse(AnswersCommand.pauseUntilTapped(validated))
    }

    private func waitForImage(_ command: AnswersCommand) -> Image {
        let textResponse = waitForResponse(command)
        if case let AnswersCommand.ask(valueType, _) = command {
            if case let AnswersValueType.imageChoice(images) = valueType {
                let index = Int(textResponse)!
                return images[index]
            }
        }
        return Image()
    }

    private func waitForResponse(_ command: AnswersCommand) -> String {
        var result: String = ""
        guard Thread.isMainThread else {
            DispatchQueue.main.sync { [unowned self] in
                result = self.waitForResponse(command)
            }
            return result
        }

        guard let liveViewMessageHandler = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
            return result
        }

        liveViewMessageHandler.delegate = self
        liveViewMessageHandler.send(command)

        repeat {
            RunLoop.main.run(mode: .default, before: Date(timeIntervalSinceNow: 0.1))
        } while responses.count == 0

        if UIAccessibility.isVoiceOverRunning {
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 1.0))
        }

        return responses.remove(at: 0)
    }
    
    // MARK: PlaygroundRemoteLiveViewProxyDelegate Methods
    
    func remoteLiveViewProxyConnectionClosed(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy) {
    }
    
    func remoteLiveViewProxy(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy, received message: PlaygroundValue) {
        guard let command = AnswersCommand(message) else {
            return
        }
        
        if case .submit(let string) = command {
            responses.append(string)
        }
    }
}
