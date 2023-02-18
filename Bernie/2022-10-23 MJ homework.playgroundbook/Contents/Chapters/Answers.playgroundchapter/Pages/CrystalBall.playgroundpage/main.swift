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
/// /*#-localizable-zone(fortune1)*/The possible fortunes of the crystal ball./*#-end-localizable-zone*/
var fortunes: [String] = [
    "/*#-localizable-zone(key1)*/Your future is quite uncertain./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key2)*/You will find happiness and joy unexpectedly./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key3)*/In a dream, your wishes will reveal themselves./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key4)*/The stars have aligned for you today./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key5)*/Be careful of signs that lead to nowhere./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key6)*/A sliver of fortune is ahead of you, if you know where to look./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key7)*/The answers to your future lie in your past./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key8)*/Be curious and you shall be rewarded./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key9)*/Everything in moderation is best practiced in moderation./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key10)*/Be kind to yourself and you will see that others do the same./*#-end-localizable-zone*/",
    "/*#-localizable-zone(key11)*/Don’t forget the little things. They always add up to big things./*#-end-localizable-zone*/"
    
]


var firstShake = true

// /*#-localizable-zone(fortune3)*/The run loop for the crystal ball continues indefinitely until you stop running the code./*#-end-localizable-zone*/
while true {
    show("🔮".image())
    if firstShake {
        show("/*#-localizable-zone(key16)*/The crystal ball shall reveal your future path, if you so choose./*#-end-localizable-zone*/")
        show("/*#-localizable-zone(key17)*/Before you look into the ball, clear your mind, quiet your thoughts, focus your intentions. Then, ask your question:/*#-end-localizable-zone*/")
        ask("/*#-localizable-zone(key18)*/What question burns in your heart?/*#-end-localizable-zone*/")
        firstShake = false
    } else {
        ask("/*#-localizable-zone(key81818181)*/The stone of energy is strong, ask another...if you dare./*#-end-localizable-zone*/")
    }
    
    pauseUntilTapped(message: "/*#-localizable-zone(key19)*/Now concentrate and look into the crystal ball, oracle./*#-end-localizable-zone*/")
    show(fortunes.randomElement() ?? "")
}
//#-end-editable-code
