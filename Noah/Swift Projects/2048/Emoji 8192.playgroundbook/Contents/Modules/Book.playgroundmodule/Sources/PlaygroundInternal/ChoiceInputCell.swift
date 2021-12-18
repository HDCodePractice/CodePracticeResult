//
//  ChoiceInputCell.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

class ChoiceInputCell : PopoverInputCell, UIPickerViewDelegate, UIPickerViewDataSource {
    private var options: [String] = []
    private let optionPicker = UIPickerView()
    
    class override var reuseIdentifier: String {
        return "ChoiceInputCell"
    }
    
    override var valueType: AnswersValueType {
        didSet {
            if case .choice(let options) = valueType {
                self.options = options
            }
            else {
                self.options = []
            }
            optionPicker.reloadAllComponents()
            
            var intrinsicWidth: CGFloat = 180.0
            for option in options {
                let optionWidth = ceil(NSAttributedString(string: option, attributes: [.font: UIFont.systemFont(ofSize: 23.5)]).size().width)
                intrinsicWidth = max(optionWidth, intrinsicWidth)
            }
            
            popoverContentSize = CGSize(width: intrinsicWidth + 40.0, height: optionPicker.intrinsicContentSize.height)
        }
    }

    override var messageText: String {
        didSet {
            delegate?.cellTextDidChange(self)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        valueType = .choice([])
        optionPicker.dataSource = self
        optionPicker.delegate = self
        optionPicker.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        optionPicker.frame = popoverViewController.view.bounds
        popoverViewController.view.addSubview(optionPicker)
        popoverContentSize = optionPicker.intrinsicContentSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func submit(_ sender: Any?) {
        // If the selection has not changed, take the currently selected item.
        if messageText.count == 0 {
            messageText = options[optionPicker.selectedRow(inComponent: 0)]
        }
        super.submit(sender)
    }

    // MARK: UIPickerViewDataSource Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    // MARK: UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        let padding: CGFloat = 4.0
        var tallest: CGFloat = 0.0
        for row in 0..<options.count {
            if let label = self.pickerView(pickerView, viewForRow: row, forComponent: component, reusing: nil) as? UILabel {
                let layoutSize = label.systemLayoutSizeFitting(CGSize(width: label.bounds.width, height: 768.0))
                tallest = max(layoutSize.height,tallest)
            }
        }
        return tallest + (2.0 * padding)
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let frame = CGRect(x: 4.0, y: 0.0, width: optionPicker.frame.size.width - 20.0, height: 0.0)
        let multiline = UILabel(frame: frame)
        multiline.font = UIFont.systemFont(ofSize: 24)
        multiline.numberOfLines = 0
        multiline.contentMode = .center
        multiline.textAlignment = .center
        multiline.text = options[row]
        multiline.sizeToFit()
        return multiline
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        messageText = options[row]
        updatePopoverPosition()
    }
}
