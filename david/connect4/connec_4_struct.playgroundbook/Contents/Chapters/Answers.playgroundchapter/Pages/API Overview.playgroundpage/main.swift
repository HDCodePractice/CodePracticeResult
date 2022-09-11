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
import UIKit

// /*#-localizable-zone(k1)*/1. Show a string, date, image, or number./*#-end-localizable-zone*/
show("/*#-localizable-zone(text1)*/Hello, World!/*#-end-localizable-zone*/")

// /*#-localizable-zone(k2)*/2. Ask for an open string response./*#-end-localizable-zone*/
ask("/*#-localizable-zone(text2)*/What’s your nickname?/*#-end-localizable-zone*/")

// /*#-localizable-zone(k3)*/3. Ask for a choice from a set of strings./*#-end-localizable-zone*/
show("/*#-localizable-zone(text3)*/What’s your favorite color?/*#-end-localizable-zone*/")
let color = askForChoice("/*#-localizable-zone(text3b)*/Color/*#-end-localizable-zone*/", strings: ["/*#-localizable-zone(text4)*/Blue/*#-end-localizable-zone*/", "/*#-localizable-zone(text5)*/Green/*#-end-localizable-zone*/", "/*#-localizable-zone(text6)*/Orange/*#-end-localizable-zone*/", "/*#-localizable-zone(text7)*/Purple/*#-end-localizable-zone*/", "/*#-localizable-zone(text8)*/Red/*#-end-localizable-zone*/", "/*#-localizable-zone(text9)*/Yellow/*#-end-localizable-zone*/"])

// /*#-localizable-zone(k4)*/4. Ask for a choice from a set of images./*#-end-localizable-zone*/
let animals: [UIImage] = ["🐌".image(), "🐥".image(), "🐋".image(), "🐎".image(), "🦍".image()]
show("/*#-localizable-zone(text10)*/Choose your favorite animal./*#-end-localizable-zone*/")
let animal = askForChoice(images: animals)

// /*#-localizable-zone(k5)*/5. Ask for a date./*#-end-localizable-zone*/
show("/*#-localizable-zone(text11)*/What’s your birthdate?/*#-end-localizable-zone*/")
let birthdate = askForDate("/*#-localizable-zone(text12)*/Birthdate/*#-end-localizable-zone*/")

// /*#-localizable-zone(k6)*/6. Ask for a number./*#-end-localizable-zone*/
show("/*#-localizable-zone(text13)*/What’s your favorite number?/*#-end-localizable-zone*/")
let number = askForNumber("/*#-localizable-zone(text14)*/Number/*#-end-localizable-zone*/")

// /*#-localizable-zone(k7)*/7. Pause until the user taps the button./*#-end-localizable-zone*/
pauseUntilTapped(message: "/*#-localizable-zone(text15)*/Ready to continue?/*#-end-localizable-zone*/")

//#-end-editable-code
