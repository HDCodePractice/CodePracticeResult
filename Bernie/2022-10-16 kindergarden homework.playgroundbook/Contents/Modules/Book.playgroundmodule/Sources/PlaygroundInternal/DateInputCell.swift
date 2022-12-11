//
//  DateInputCell.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

class DateInputCell : PopoverInputCell {
    private var dateFormatter = DateFormatter()
    private let datePicker = UIDatePicker()
    
    class override var reuseIdentifier: String {
        return "DateInputCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        valueType = .date
        dateFormatter.dateStyle = .long
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(DateInputCell.valueDidChange), for: .valueChanged)
        datePicker.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        datePicker.frame = popoverViewController.view.bounds
        popoverViewController.view.addSubview(datePicker)
        popoverContentSize = datePicker.intrinsicContentSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func submit(_ sender: Any?) {
        // If the selection has not changed, take the currently selected item.
        if messageText.count == 0 {
            messageText = dateFormatter.string(from: datePicker.date)
        }
        super.submit(sender)
    }
    
    @objc private func valueDidChange() {
        messageText = dateFormatter.string(from: datePicker.date)
    }
}
