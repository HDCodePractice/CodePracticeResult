//
//  AnswersPlayground.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

public typealias Image = UIImage

private let answersLiveViewClient = AnswersLiveViewClient()

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()

/// Shows a string in the current playground page’s live view.
/// - localizationKey: show(_ string:)
public func show(_ string: String) {
    answersLiveViewClient.show(string)
}

/// Shows a number in the current playground page’s live view.
/// - localizationKey: show(_ number:)
public func show(_ number: Int) {
    answersLiveViewClient.show(String(number))
}

/// Shows a decimal in the current playground page’s live view.
/// - localizationKey: show(_ decimal:)
public func show(_ decimal: Double) {
    answersLiveViewClient.show(String(decimal))
}

/// Shows a date in the current playground page’s live view.
/// - localizationKey: show(_ date:)
public func show(_ date: Date) {
    answersLiveViewClient.show(dateFormatter.string(for: date) ?? "")
}

/// Shows an image in the current playground page’s live view.
/// - localizationKey: show(_ image:)
public func show(_ image: Image) {
    answersLiveViewClient.show(image)
}

/// Asks for a string in the current playground page’s live view.
/// - localizationKey: ask(_:)
public func ask(_ placeholder: String? = nil) -> String {
    return answersLiveViewClient.ask(forType: .string, placeholder: placeholder ?? NSLocalizedString("Input", comment: "User input placeholder text."))
}

/// Asks for a number in the current playground page’s live view.
/// - localizationKey: askForNumber(_:)
public func askForNumber(_ placeholder: String? = nil) -> Int {
    return Int(answersLiveViewClient.ask(forType: .number, placeholder: placeholder ?? NSLocalizedString("Number", comment: "Number picker placeholder text."))) ?? 0
}

/// Asks for a decimal in the current playground page’s live view.
/// - localizationKey: askForDecimal(_:)
public func askForDecimal(_ placeholder: String? = nil) -> Double {
    return Double(answersLiveViewClient.ask(forType: .decimal, placeholder: placeholder ?? NSLocalizedString("Decimal", comment: "Decimal picker placeholder text."))) ?? 0
}

/// Asks for a date in the current playground page’s live view.
/// - localizationKey: askForDate(_:)
public func askForDate(_ placeholder: String? = nil) -> Date {
    let dateString: String = answersLiveViewClient.ask(forType: .date, placeholder: placeholder ?? NSLocalizedString("Date", comment: "Date picker placeholder text."))
    return dateFormatter.date(from:dateString) ?? Date()
}

/// Asks for a choice of string in the current playground page’s live view, chosen from the array of options provided.
/// - localizationKey: askForChoice(_:options:String)
public func askForChoice(_ placeholder: String? = nil, strings: [String]) -> String {
    return answersLiveViewClient.ask(forType: .choice(strings), placeholder: placeholder ?? NSLocalizedString("Choice", comment: "String picker placeholder text."))
}

/// Asks for a choice of image in the current playground page’s live view, chosen from the options provided.
/// - localizationKey: askForChoice(_:options:Image)
public func askForChoice(_ placeholder: String? = nil, images: [Image]) -> Image {
    return answersLiveViewClient.ask(forType: .imageChoice(images), placeholder: placeholder ?? NSLocalizedString("Choose an image", comment: "Image picker placeholder text."))
}

/// Pauses output until the user taps on this item in the page’s live view.
/// - localizationKey: pauseUntilTapped(message:)
public func pauseUntilTapped(message: String = "") {
    answersLiveViewClient.pauseUntilTapped(message: message)
}
