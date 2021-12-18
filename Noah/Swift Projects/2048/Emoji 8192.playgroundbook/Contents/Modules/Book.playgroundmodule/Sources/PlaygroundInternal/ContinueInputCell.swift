//
//  ContinueInputCell.swift
//
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class ContinueInputCell: InputCell {

    class override var reuseIdentifier: String {
        return "ContinueInputCell"
    }

    // MARK:-

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        textEntryView.isHidden = true
        submitButton.isHidden = true

        messageLabel.isHidden = false
        messageLabel.alpha = 1.0
        messageLabel.font = UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .medium)
        messageLabel.textColor = submitButton.tintColor

        messageLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(submit(_:))))
        messageLabel.isUserInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return (action == #selector(submit(_:)))
    }

    // MARK:- Internal Methods

    @objc override func submit(_ sender: Any?) {

        delegate?.cell(self, didSubmitText: "Continue")
    }
}
