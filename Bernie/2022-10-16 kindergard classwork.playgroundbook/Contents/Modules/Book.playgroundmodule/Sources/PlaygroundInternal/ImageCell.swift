//
//  ImageCell.swift
//
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    let sourceIndicator = CAShapeLayer()

    static let defaultLayoutMargins: UIEdgeInsets = {
        let verticalPadding = ceil(UIFont.preferredFont(forTextStyle: .body).lineHeight / 2.0)
        return UIEdgeInsets(top: verticalPadding, left: 55.0, bottom: verticalPadding, right: 20)
    }()

    class var reuseIdentifier: String {
        return "ImageCell"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        selectionStyle = .none
        layoutMargins = ImageCell.defaultLayoutMargins

        layer.addSublayer(sourceIndicator)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- Layout

    override func layoutSubviews() {
        sourceIndicator.frame = CGRect(x: layoutMargins.left - 20,
                                       y: layoutMargins.top,
                                       width: 5,
                                       height: bounds.height - layoutMargins.top - layoutMargins.bottom)
        sourceIndicator.path = UIBezierPath(roundedRect: sourceIndicator.bounds, cornerRadius: sourceIndicator.bounds.width / 2.0).cgPath
        sourceIndicator.fillColor = (UIColor(named: "sourceIndicator") ?? UIColor(white: 0.0, alpha: 0.2)).cgColor

        super.layoutSubviews()
    }
}
