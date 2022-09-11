//
//  ImageChoiceInputCell.swift
//
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

protocol ImageChoiceInputDelegate {

    func cell(_ cell: ImageChoiceInputCell, didSubmitImage image: UIImage)
}

// MARK:-

class ImageChoiceInputCell : PopoverInputCell, ImageChooserDelegate {

    private var images: [UIImage] = []
    private let chooser = ImageChooser()

    var selectedItem: Int = 0

    class override var reuseIdentifier: String {
           return "ImageChoiceInputCell"
    }

    override var valueType: AnswersValueType {
        didSet {
            if case .imageChoice(let images) = valueType {
                self.images = images
            }
            else {
                self.images = []
            }
            chooser.images = self.images
        }
    }

    // MARK:-

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        valueType = .imageChoice([])

        let columns: CGFloat = 2
        let rows: CGFloat = 2

        let itemWidth: CGFloat = 100.0
        let itemHeight: CGFloat = 100.0

        let chooserWidth = itemWidth * columns
        let chooserHeight = itemHeight * rows

        chooser.itemSize = CGSize(width: itemWidth, height: itemHeight)
        chooser.collectionView.backgroundColor = .clear
//        chooser.selectionColor = .white
        chooser.delegate = self

        let chooserView = chooser.view!
        chooserView.translatesAutoresizingMaskIntoConstraints = false
        chooserView.backgroundColor = .clear

        // chooser must be added as child controller.
        popoverViewController.addChild(chooser)
        chooser.didMove(toParent: popoverViewController)

        popoverViewController.view.addSubview(chooserView)
        NSLayoutConstraint.activate([
            popoverViewController.view.bottomAnchor.constraint(equalTo: chooserView.bottomAnchor),
            popoverViewController.view.centerXAnchor.constraint(equalTo: chooserView.centerXAnchor),
            chooserView.widthAnchor.constraint(equalToConstant: chooserWidth),
            chooserView.heightAnchor.constraint(equalToConstant: chooserHeight)
        ])

        popoverContentSize = CGSize(width: chooserWidth,
                                    height: chooserHeight)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:-

    @objc override func submit(_ sender: Any?) {
        guard inputEnabled else {
            return
        }

        if let imageChoiceDelegate = delegate as? ImageChoiceInputDelegate {
            imageChoiceDelegate.cell(self, didSubmitImage: images[selectedItem])
        }

        super.submit(self)
    }

    // MARK:- ImageChooserDelegate

    func imageChooser(_ chooser: ImageChooser, didSelect image: UIImage) {
        selectedItem = chooser.selectedIndexPath!.item
        messageText = NSLocalizedString("Image Selected", comment: "An image has been selected in the image picker.")
    }
}
