//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//
//#-end-hidden-code
//#-code-completion(identifier, hide, setupLiveView())
//#-hidden-code
import Foundation
//#-end-hidden-code
//#-editable-code Tap to enter code
show("/*#-localizable-zone(whatIsYourNameText)*/What’s your name?/*#-end-localizable-zone*/")

let name = ask("/*#-localizable-zone(nameText)*/Name/*#-end-localizable-zone*/")

show("/*#-localizable-zone(hiText)*/Hi /*#-end-localizable-zone*/" + name)

//#-end-editable-code
