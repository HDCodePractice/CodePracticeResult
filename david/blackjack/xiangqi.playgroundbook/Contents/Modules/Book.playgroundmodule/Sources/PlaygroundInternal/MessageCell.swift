//
//  MessageCell.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    let sourceIndicator = CAShapeLayer()
    let messageLabel = UILabel()
    
    static let defaultLayoutMargins: UIEdgeInsets = {
        let verticalPadding = ceil(UIFont.preferredFont(forTextStyle: .body).lineHeight / 2.0)
        return UIEdgeInsets(top: verticalPadding, left: 55.0, bottom: verticalPadding, right: 20)
    }()
    
    var selectionRect: CGRect {
        var rect = messageLabel.frame
        rect.size.width = min(messageLabel.intrinsicContentSize.width, rect.size.width)
        return rect
    }
    
    var messageText: String {
        get {
            return messageLabel.text ?? ""
        }
        set (text) {
            messageLabel.text = text
        }
    }
    
    class var reuseIdentifier: String {
        return "MessageCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        layoutMargins = MessageCell.defaultLayoutMargins
        
        layer.addSublayer(sourceIndicator)
        
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.font = UIFont.preferredFont(forTextStyle: .body)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            messageLabel.trailingAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.trailingAnchor),
            messageLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        sourceIndicator.frame = CGRect(x: layoutMargins.left - 20,
                                       y: layoutMargins.top,
                                       width: 5,
                                       height: bounds.height - layoutMargins.top - layoutMargins.bottom)
        sourceIndicator.path = UIBezierPath(roundedRect: sourceIndicator.bounds, cornerRadius: sourceIndicator.bounds.width / 2.0).cgPath
        
        messageLabel.preferredMaxLayoutWidth = bounds.width - layoutMargins.left - layoutMargins.right
        
        sourceIndicator.fillColor = (UIColor(named: "sourceIndicator") ?? UIColor(white: 0.0, alpha: 0.2)).cgColor
        
        super.layoutSubviews()
    }
    
    // MARK: Accessibility
    
    override var accessibilityLabel: String? {
        set {
            assertionFailure("Don’t try to set the accessibility properties of an MessageCell.")
        }
        get {
            let outputFormat = NSLocalizedString("Output, %@", comment: "Accessibility text format for the output cell")
            return String(format: outputFormat, messageText)
        }
    }
}
