//
//  InputCell.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

class InputCell: MessageCell, UITextViewDelegate {
    let textEntryView = TextEntryView()
    let submitButton = UIButton(type: .system)
    private(set) var textEntryMinimumWidthConstraint: NSLayoutConstraint!
    private(set) var inputEnabled: Bool = false
    var indexPath: IndexPath?
    var valueType: AnswersValueType = .string
    weak var delegate: InputCellDelegate?
    var didBecomeActiveObserver: NSObjectProtocol? = nil
    
    static let keyboardDismissDelay = 1.0
    static let submitTitleString: NSAttributedString = {
        let submitButtonTitle = NSLocalizedString("Submit", comment: "Title of the 'submit' button")
        return NSAttributedString(string: submitButtonTitle, attributes: [.font: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .medium)])
    }()
    
    static var submitButtonWidthPlusSpacing: CGFloat = {
        return ceil(submitTitleString.size().width) + 8.0 + 7.0
    }()
    
    override var messageText: String {
        get {
            return textEntryView.text
        }
        set (text) {
            super.messageText = text
            textEntryView.text = text
            submitButton.isHidden = !inputEnabled || text.count == 0
        }
    }
    
    var placeholderText: String? {
        get {
            return textEntryView.placeholder
        }
        set (placeholderText) {
            textEntryView.placeholder = placeholderText
        }
    }
    
    class override var reuseIdentifier: String {
        return "InputCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textEntryView.delegate = self
        textEntryView.backgroundColor = UIColor.clear
        textEntryView.font = UIFont.preferredFont(forTextStyle: .body)
        textEntryView.translatesAutoresizingMaskIntoConstraints = false
        textEntryView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        contentView.addSubview(textEntryView)
        
        textEntryView.isHidden = true
        
        submitButton.setAttributedTitle(InputCell.submitTitleString, for: [])
        submitButton.addTarget(self, action: #selector(InputCell.submit(_:)), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        contentView.addSubview(submitButton)
        
        submitButton.isHidden = true
        
        NSLayoutConstraint.activate([
            textEntryView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: -7.0),
            submitButton.leadingAnchor.constraint(equalTo: textEntryView.trailingAnchor, constant: 8.0),
            submitButton.trailingAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.trailingAnchor),
            messageLabel.trailingAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.trailingAnchor, constant: -InputCell.submitButtonWidthPlusSpacing),
            
            textEntryView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            textEntryView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            submitButton.lastBaselineAnchor.constraint(equalTo: textEntryView.bottomAnchor, constant: -4)
        ])
        
        textEntryMinimumWidthConstraint = textEntryView.widthAnchor.constraint(greaterThanOrEqualToConstant: 220)
        textEntryMinimumWidthConstraint.priority = .defaultHigh
        textEntryMinimumWidthConstraint.isActive = true
        
        didBecomeActiveObserver = NotificationCenter.default.addObserver(forName: .NSExtensionHostDidBecomeActive, object: nil, queue: .main) { [weak self] notification in
            if let inputEnabled = self?.inputEnabled, inputEnabled {
                self?.textEntryView.becomeFirstResponder()
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        sourceIndicator.fillColor = UIColor(white: 0.0, alpha: 0.9).cgColor
        
        if #available(iOS 13.0, *) {
            sourceIndicator.fillColor = UIColor.label.cgColor
        }
    }
    
    deinit {
        if let observer = didBecomeActiveObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    // MARK: Internal Methods
    
    func setInputEnabled(_ inputEnabled: Bool, animated: Bool) {
        guard self.inputEnabled != inputEnabled else {
            return
        }
        
        messageLabel.text = textEntryView.text
        self.inputEnabled = inputEnabled
        
        accessibilityElements = inputEnabled ? [textEntryView, submitButton] : nil
        
        let submitButtonHidden = !inputEnabled || textEntryView.text.count == 0
        if animated {
            messageLabel.alpha = inputEnabled ? 1.0 : 0.0
            textEntryView.alpha = !inputEnabled ? 1.0 : 0.0
            submitButton.alpha = submitButton.isHidden ? 0.0 : 1.0
            
            messageLabel.isHidden = false
            textEntryView.isHidden = false
            submitButton.isHidden = false
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
                self.messageLabel.alpha = inputEnabled ? 0.0 : 1.0
                self.textEntryView.alpha = !inputEnabled ? 0.0 : 1.0
                self.submitButton.alpha = submitButtonHidden ? 0.0 : 1.0
            }, completion: { (_) in
                self.messageLabel.isHidden = inputEnabled
                self.textEntryView.isHidden = !inputEnabled
                self.submitButton.isHidden = submitButtonHidden
                
                self.messageLabel.alpha = 1.0
                self.textEntryView.alpha = 1.0
                self.submitButton.alpha = 1.0
            })
            
            if !inputEnabled {
                textEntryView.perform(#selector(resignFirstResponder), with: nil, afterDelay: InputCell.keyboardDismissDelay)
            }
        }
        else {
            messageLabel.isHidden = inputEnabled
            textEntryView.isHidden = !inputEnabled
            submitButton.isHidden = submitButtonHidden
            
            if !inputEnabled {
                textEntryView.resignFirstResponder()
            }
        }
    }

    func hideSubmitButton(_ hide: Bool) {
        if submitButton.isHidden != hide {
            submitButton.alpha = submitButton.isHidden ? 0.0 : 1.0
            submitButton.isHidden = false

            UIView.animate(withDuration: 0.2, animations: {
                self.submitButton.alpha = hide ? 0.0 : 1.0
            }, completion: { (_) in
                self.submitButton.isHidden = hide
                self.submitButton.alpha = 1.0
            })
        }
    }

    // MARK: UITableViewCell Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        indexPath = nil
        setInputEnabled(false, animated: false)
    }
    
    // Avoid animating input cells on table view transitions
    func _setAnimating(_ animating: Bool, clippingAdjacentCells: Bool) {
    }
    
    // MARK: UITextViewDelegate Methods
    
    func textViewDidChange(_ textView: UITextView) {
        guard inputEnabled else {
            return
        }
        
        hideSubmitButton(textEntryView.text.count == 0)
        delegate?.cellTextDidChange(self)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return inputEnabled
    }
    
    // MARK: Actions
    
    @objc func submit(_ sender: Any?) {
        guard inputEnabled && textEntryView.text.count > 0 else {
            return
        }
        
        setInputEnabled(false, animated: true)
        delegate?.cell(self, didSubmitText: textEntryView.text)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return (action == #selector(InputCell.submit(_:)))
    }
    
    // MARK: Key Commands
    
    override var keyCommands: [UIKeyCommand] {
        return [
            UIKeyCommand(input: "\r", modifierFlags: [], action: #selector(InputCell.submit(_:))),
            UIKeyCommand(input: "\r", modifierFlags: .shift, action: #selector(InputCell.submit(_:))),
            UIKeyCommand(input: "\r", modifierFlags: .alphaShift, action: #selector(InputCell.submit(_:)))
        ]
    }
    
    // MARK: Accessibility
    
    override var accessibilityLabel: String? {
        set {
            assertionFailure("Don’t try to set the accessibility properties of an InputCell.")
        }
        get {
            let inputFormat = NSLocalizedString("Input, %@", comment: "Accessibility text format for the input cell")
            return String(format: inputFormat, messageText)
        }
    }
}

protocol InputCellDelegate : AnyObject {
    func cellTextDidChange(_ cell: InputCell)
    func cell(_ cell: InputCell, didSubmitText: String)
    func cellShouldPresentPopover(_ cell: InputCell) -> Bool
    func presentPopover(_ popoverViewController: UIViewController, for cell: InputCell)
    func dismissPopover(_ popoverViewController: UIViewController, for cell: InputCell)
    func cell(_ cell: InputCell, willDismissPopover popoverViewController: UIViewController)
}
