//
//  AnswersViewController.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

class AnswersViewController: UITableViewController, PlaygroundLiveViewMessageHandler, InputCellDelegate, ImageChoiceInputDelegate, UIKeyInput {
    private var items: [TranscriptItem] = []
    private var itemHeightCache = NSCache<NSString, NSNumber>()
    private var previousLayoutSize: CGSize = CGSize()
    private var hasPopoverContentInset = false
    private var hasKeyboardContentInset = false
    private var pendingPopoverCell: PopoverInputCell? = nil
    private var keyboardDismissTimer: Timer? = nil
    private var hasRecentlyShownStringEditableContent = false
    static let insertAnimationDuration: Double = 0.4
    private static let popoverInsetAnimationDuration: Double = 0.25
    private static let defaultBottomContentInset: CGFloat = 72.0
    private var placeholderContent: [UIView] = []
    
    override var canBecomeFirstResponder: Bool {
        get {
            var become = false
            
            if let lastItem = items.last {
                become = !lastItem.isEditing && hasRecentlyShownStringEditableContent
            }
            
            return become
        }
    }
    
    public var hasText: Bool {
        return false
    }

    // MARK:-
    
    public func insertText(_ text: String) {}
    
    public func deleteBackward() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let placeholderView = UIView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()

        let gradientBackground = BackgroundGradientView.backgroundWithPreferredColors()
        gradientBackground.frame = view.bounds
        gradientBackground.translatesAutoresizingMaskIntoConstraints = false
        placeholderView.addSubview(gradientBackground)

        var symbolView = UIImageView(frame: .zero)
        symbolView.translatesAutoresizingMaskIntoConstraints = false

        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 34, weight: .regular)
        if let symbol = UIImage(systemName: "rectangle.slash", withConfiguration: symbolConfig) {
            symbolView.image = symbol.withTintColor(titleLabel.textColor, renderingMode: .alwaysOriginal)

            NSLayoutConstraint.activate([
                symbolView.widthAnchor.constraint(equalToConstant: symbol.size.width),
                symbolView.heightAnchor.constraint(equalToConstant: symbol.size.height)
            ])
       }

        placeholderView.addSubview(symbolView)
        placeholderContent.append(symbolView)

        titleLabel.text = NSLocalizedString("No output to show", comment: "Title label when there isn’t any output from the answers template")
        titleLabel.textColor = UIColor.black
        if #available(iOS 13.0, *) {
            titleLabel.textColor = UIColor.label
        }
        titleLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderView.addSubview(titleLabel)
        placeholderContent.append(titleLabel)

        messageLabel.text = NSLocalizedString("Run your code to see your show() and ask() commands here", comment: "Content label when there isn’t any output from the answers template")
        messageLabel.textColor = UIColor(white: 0.0, alpha: 0.5)
        if #available(iOS 13.0, *) {
            messageLabel.textColor = UIColor.secondaryLabel
        }
        messageLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderView.addSubview(messageLabel)
        placeholderContent.append(messageLabel)
        
        let topConstraint = NSLayoutConstraint(item: symbolView, attribute: .top, relatedBy: .equal, toItem: placeholderView, attribute: .bottom, multiplier: 0.24, constant: 0.0)
        
        NSLayoutConstraint.activate([
            topConstraint,
            symbolView.centerXAnchor.constraint(equalTo: placeholderView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: symbolView.bottomAnchor, constant: 16.0),
            titleLabel.centerXAnchor.constraint(equalTo: placeholderView.centerXAnchor),
            messageLabel.centerXAnchor.constraint(equalTo: placeholderView.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            messageLabel.widthAnchor.constraint(equalToConstant: 300.0),
            gradientBackground.topAnchor.constraint(equalTo: placeholderView.topAnchor),
            gradientBackground.bottomAnchor.constraint(equalTo: placeholderView.bottomAnchor),
            gradientBackground.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor),
            gradientBackground.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor)
        ])
        
        tableView.backgroundView = placeholderView
        
        tableView.backgroundColor = UIColor(white: 1.0, alpha: 0.02)
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .interactive
        tableView.cellLayoutMarginsFollowReadableWidth = false
        tableView.contentInset.bottom = AnswersViewController.defaultBottomContentInset
        tableView.allowsSelection = false

        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseIdentifier)
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.reuseIdentifier)
        tableView.register(InputCell.self, forCellReuseIdentifier: InputCell.reuseIdentifier)
        tableView.register(NumberInputCell.self, forCellReuseIdentifier: NumberInputCell.reuseIdentifier)
        tableView.register(DateInputCell.self, forCellReuseIdentifier: DateInputCell.reuseIdentifier)
        tableView.register(ChoiceInputCell.self, forCellReuseIdentifier: ChoiceInputCell.reuseIdentifier)
        tableView.register(ContinueInputCell.self, forCellReuseIdentifier: ContinueInputCell.reuseIdentifier)
        tableView.register(ImageChoiceInputCell.self, forCellReuseIdentifier: ImageChoiceInputCell.reuseIdentifier)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AnswersViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AnswersViewController.keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AnswersViewController.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AnswersViewController.keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if view.bounds.width != previousLayoutSize.width || view.bounds.height != previousLayoutSize.height {
            if view.bounds.width != previousLayoutSize.width {
                itemHeightCache.removeAllObjects()
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            updateContentInsetsWithSize(view.bounds.size)
            previousLayoutSize = view.bounds.size
            
            if let lastItem = items.last, lastItem.isUserEntered {
                tableView.scrollToRow(at: IndexPath(row: items.count - 1, section: 0), at: .bottom, animated: false)
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            updatePopoverPosition()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for (index, item) in items.enumerated() {
            if item.isEditing {
                let indexPath = IndexPath(row: index, section: 0)
                if let cell = tableView.cellForRow(at: indexPath) as? InputCell {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                        cell.textEntryView.becomeFirstResponder()
                        cell.textEntryView.becomeFirstResponder()
                    }
                    return
                }
            }
        }
    }
    
    // MARK:- Internal Methods
    
    func show(_ string: String) {
        append(item: TranscriptItem(text: string), animated: true)
    }

    func show(_ image: UIImage) {
        append(item: TranscriptImage(image: image), animated: true)
    }
    
    func ask(forType valueType: AnswersValueType, placeholder: String) {
        append(item: TranscriptItem(userEnteredText: "", valueType: valueType, placeholder: placeholder, isEditing: true), animated: true)
        hasRecentlyShownStringEditableContent = valueType == AnswersValueType.string
    }
    
    func clear() {
        items.removeAll()
        itemHeightCache.removeAllObjects()
        tableView.reloadData()
    }

    func pause(withPrompt: String) {
        append(item: TranscriptPause(prompt: withPrompt), animated: true)
    }
    
    // MARK:- Private Methods

    private func updatePopoverPosition() {
        if let popover = presentedViewController,
           let presenter = popover.popoverPresentationController,
           let popoverCell = presenter.sourceView as? PopoverInputCell {
            popoverCell.updatePopoverPosition()
        }
    }

    private func updateContentInsetsWithSize(_ size: CGSize) {
        let screen = view.window?.screen ?? UIScreen.main
        // Add inset for top toolbar (when live view is not side-by-side)
        tableView.contentInset.top = size.width == screen.bounds.width / 2.0 || size.width == screen.bounds.height / 2.0 || size.width == 490.5 ? 20.0 : 72.0
    }
    
    private func append(item: TranscriptItem, animated: Bool) {
        let insertedItemIndexPath = IndexPath(row: items.count, section: 0)
        let contentBottomMargin = tableView.contentOffset.y + tableView.frame.size.height - tableView.contentInset.bottom - tableView.contentSize.height
        
        items.append(item)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [insertedItemIndexPath], with: .none)
        tableView.endUpdates()
        
        if animated {
            if contentBottomMargin.distance(to: 0.0) <= tableView.rectForRow(at: insertedItemIndexPath).height {
                scrollToInsertedCell(at: insertedItemIndexPath)
            }
            
            if let cell = tableView.cellForRow(at: insertedItemIndexPath) {
                let finalCellCenter = cell.center
                cell.center.y += 20
                cell.alpha = 0.0
                
                UIView.animate(withDuration: AnswersViewController.insertAnimationDuration, delay: 0.0, options: .curveEaseOut, animations: {
                    cell.center = finalCellCenter
                    cell.alpha = 1.0
                }, completion: { (_) in
                    if item.isEditing {
                        (cell as! InputCell).textEntryView.becomeFirstResponder()
                        (cell as! InputCell).textEntryView.becomeFirstResponder()
                    }
                    
                    UIAccessibility.post(notification: .layoutChanged, argument: cell)
                })
            }
        }
        
        resetKeyboardDismissTimer(invalidateOnly: item.isUserEntered)
    }
    
    private func resetKeyboardDismissTimer(invalidateOnly: Bool = false) {
        if let timer = keyboardDismissTimer {
            timer.invalidate()
            keyboardDismissTimer = nil
        }
        
        if !invalidateOnly {
            _ = becomeFirstResponder()
            
            keyboardDismissTimer = Timer.scheduledTimer(withTimeInterval: InputCell.keyboardDismissDelay, repeats: false) { timer in
                self.resignFirstResponder()
            }
        }
    }
    
    private func scrollToInsertedCell(at indexPath: IndexPath) {
        let insertedCell = tableView.cellForRow(at: indexPath)
        
        if let popoverCell = insertedCell as? PopoverInputCell {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(AnswersViewController.resetContentInset), object: nil)
            if hasKeyboardContentInset {
                pendingPopoverCell = popoverCell
                UIView.animate(withDuration: AnswersViewController.insertAnimationDuration, delay: 0.0, options: [.beginFromCurrentState, .curveEaseOut], animations: {
                    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
                })
            }
            else {
                UIView.animate(withDuration: AnswersViewController.insertAnimationDuration, delay: 0.0, options: [.beginFromCurrentState, .curveEaseOut], animations: {
                    self.tableView.contentInset.bottom = AnswersViewController.defaultBottomContentInset - self.tableView.contentInset.top + popoverCell.popoverContentSize.height + 40.0
                    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
                })
            }
            
            hasPopoverContentInset = false
        }
        else {
            UIView.animate(withDuration: AnswersViewController.insertAnimationDuration, delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
            })
        }
    }
    
    @objc private func resetContentInset() {
        hasPopoverContentInset = false
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(AnswersViewController.resetContentInset), object: nil)
        UIView.animate(withDuration: AnswersViewController.popoverInsetAnimationDuration, delay: 0.0, options: [.beginFromCurrentState, .curveEaseInOut], animations: {
            self.tableView.contentInset.bottom = AnswersViewController.defaultBottomContentInset
        })
    }
    
    @objc private func updateContentInset(forCell cell: PopoverInputCell) {
        guard let indexPath = cell.indexPath else {
            return
        }
        
        hasKeyboardContentInset = false
        
        UIView.animate(withDuration: AnswersViewController.popoverInsetAnimationDuration, delay: 0.0, options: [.beginFromCurrentState, .curveEaseInOut], animations: {
            self.tableView.contentInset.bottom = AnswersViewController.defaultBottomContentInset - self.tableView.contentInset.top + cell.popoverContentSize.height + 40.0
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }, completion: { (_) in
            cell.textEntryView.becomeFirstResponder()
        })
    }

    @objc func keyboardWillShow(_ note: NSNotification) {
        if hasPopoverContentInset {
            resetContentInset()
        }
    }
    
    @objc func keyboardDidShow(_ note: NSNotification) {
        hasKeyboardContentInset = true
    }
    
    @objc func keyboardWillHide(_ note: NSNotification) {
        if let cell = pendingPopoverCell {
            pendingPopoverCell = nil
            perform(#selector(AnswersViewController.updateContentInset(forCell:)), with: cell, afterDelay: 0.01)
        }
    }
    
    @objc func keyboardDidHide(_ note: NSNotification) {
        hasKeyboardContentInset = false
    }
    
    // MARK:- UITableViewDataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]

        if item.isUserEntered {
            let valueType = item.valueType ?? .string
            var cellReuseIdentifier: String
            
            switch valueType {
            case .number, .decimal:
                cellReuseIdentifier = NumberInputCell.reuseIdentifier
            case .date:
                cellReuseIdentifier = DateInputCell.reuseIdentifier
            case .choice(_):
                cellReuseIdentifier = ChoiceInputCell.reuseIdentifier
            case .imageChoice(_):
                cellReuseIdentifier = ImageChoiceInputCell.reuseIdentifier
            default:
                cellReuseIdentifier = InputCell.reuseIdentifier
            }
            
            let inputCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! InputCell
            inputCell.delegate = self
            inputCell.indexPath = indexPath
            inputCell.messageText = item.text
            inputCell.valueType = valueType
            inputCell.placeholderText = item.placeholder
            inputCell.setInputEnabled(item.isEditing, animated: false)
            
            return inputCell
        }
        else if let item = item as? TranscriptPause {
            let continueCell = tableView.dequeueReusableCell(withIdentifier: ContinueInputCell.reuseIdentifier, for: indexPath) as! ContinueInputCell
            continueCell.delegate = self
            continueCell.indexPath = indexPath
            continueCell.messageText = item.text

            return continueCell
        }
        else if let item = item as? TranscriptImage {
            let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseIdentifier, for: indexPath) as! ImageCell
            imageCell.imageView?.image = item.image
            imageCell.textLabel?.text = item.text

            return imageCell
        }
        else {
            let messageCell = tableView.dequeueReusableCell(withIdentifier: MessageCell.reuseIdentifier, for: indexPath) as! MessageCell
            messageCell.messageText = item.text
            messageCell.layoutMargins.right = InputCell.submitButtonWidthPlusSpacing + InputCell.defaultLayoutMargins.right

            return messageCell
        }
    }
    
    // MARK:- UITableViewDelegate Methods
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch cell {
        // Always show the submit button when using a ChoiceInputCell.
        case let special as ChoiceInputCell:
            special.hideSubmitButton(false)
        // Always show the submit button when using a DateInputCell.
        case let special as DateInputCell:
            special.hideSubmitButton(false)
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.row]
        var itemHeight: Double? = itemHeightCache.object(forKey: item.uuid as NSString)?.doubleValue

        if itemHeight == nil {
            let boundingSize = CGSize(width: tableView.bounds.width - InputCell.defaultLayoutMargins.left - InputCell.submitButtonWidthPlusSpacing - InputCell.defaultLayoutMargins.right, height: CGFloat.greatestFiniteMagnitude)
            itemHeight = item.preferredHeight(with: boundingSize, font: UIFont.preferredFont(forTextStyle: .body))

            if !item.isEditing || item.text.count == 0 {
                itemHeightCache.setObject(NSNumber(value: itemHeight!), forKey: item.uuid as NSString)
            }
        }
        
        let screen = view.window?.screen ?? UIScreen.main
        let padding: CGFloat = (screen.bounds.width >= 1366.0 || screen.bounds.height >= 1366.0) && tableView.bounds.height >= 916.0 ? 16.0 : 8.0
        return CGFloat(floor(itemHeight!)) + InputCell.defaultLayoutMargins.top + InputCell.defaultLayoutMargins.bottom + padding
    }
    
    override func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        let item = items[indexPath.row]
        return !item.isEditing
    }
    
    override func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return action == #selector(copy(_:))
    }
    
    override func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        let item = items[indexPath.row]
        UIPasteboard.general.string = item.text
    }
    
    func tableView(tableView: UITableView, calloutTargetRectForCell cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) -> CGRect {
        if let messageCell = cell as? MessageCell {
            return messageCell.selectionRect
        }
        else {
            return cell.bounds
        }
    }
    
    // MARK:- PlaygroundLiveViewMessageHandler Methods
    
    func liveViewMessageConnectionOpened() {
        for label in placeholderContent {
            label.isHidden = true
        }
        clear()
    }
    
    func liveViewMessageConnectionClosed() {
        if presentedViewController != nil {
            dismiss(animated: true, completion: nil)
        }
        
        for (index, item) in items.enumerated() {
            if item.isEditing {
                let indexPath = IndexPath(row: index, section: 0)
                if let cell = tableView.cellForRow(at: indexPath) as? InputCell {
                    cell.setInputEnabled(false, animated: false)
                }
                
                items.replaceSubrange(index...index, with: [TranscriptItem(userEnteredText: item.text)])
            }
        }
    }
    
    func receive(_ message: PlaygroundValue) {
        guard let command = AnswersCommand(message) else {
            return
        }
        
        switch command {
        case .show(let string):
            show(string)
        case .showImage(let image):
            show(image)
        case .ask(let valueType, let placeholder):
            ask(forType: valueType, placeholder: placeholder)
        case .clear:
            clear()
        case .pauseUntilTapped(let prompt):
            pause(withPrompt: prompt)
        default: break
        }
    }

    // MARK:- InputCellDelegate Methods
    
    func cellTextDidChange(_ cell: InputCell) {
        guard let indexPath = cell.indexPath else {
            return
        }
        
        items.replaceSubrange(indexPath.row...indexPath.row, with: [TranscriptItem(userEnteredText: cell.messageText, valueType: cell.valueType, placeholder: cell.placeholderText, isEditing: true)])
        
        if (tableView.indexPathsForVisibleRows ?? []).contains(indexPath) {
            let contentBottomMargin = tableView.contentOffset.y + tableView.frame.size.height - tableView.contentInset.bottom - tableView.contentSize.height
            
            // Force cell heights to recalculate
            tableView.beginUpdates()
            tableView.endUpdates()
            
            if contentBottomMargin >= 0.0 {
                tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
            }
        }
    }
    
    func cell(_ cell: InputCell, didSubmitText text: String) {
        guard let indexPath = cell.indexPath else {
            return
        }
        guard type(of: cell) != ImageChoiceInputCell.self else {
            return
        }

        switch cell {
        case is ContinueInputCell:
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        default:
            items.replaceSubrange(indexPath.row...indexPath.row, with: [TranscriptItem(userEnteredText: text)])
        }
        send(AnswersCommand.submit(text))
    }
    
    func cellShouldPresentPopover(_ cell: InputCell) -> Bool {
        return !hasKeyboardContentInset
    }
    
    func presentPopover(_ popoverViewController: UIViewController, for cell: InputCell) {
        guard let indexPath = cell.indexPath else {
            return
        }
        
        let popoverBottomInset = AnswersViewController.defaultBottomContentInset - self.tableView.contentInset.top + popoverViewController.preferredContentSize.height + 40.0
        UIView.animate(withDuration: AnswersViewController.popoverInsetAnimationDuration, delay: 0.0, options: [.beginFromCurrentState, .curveEaseInOut], animations: {
            self.tableView.contentInset.bottom = popoverBottomInset
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }, completion: { (_) in
            self.tableView.contentInset.bottom = popoverBottomInset
            self.present(popoverViewController, animated: true, completion: nil)
        })
    }
    
    func dismissPopover(_ popoverViewController: UIViewController, for cell: InputCell) {
        dismiss(animated: true, completion: nil)
        hasPopoverContentInset = true
        perform(#selector(AnswersViewController.resetContentInset), with: nil, afterDelay: 1.0)
    }
    
    func cell(_ cell: InputCell, willDismissPopover popoverViewController: UIViewController) {
        UIView.animate(withDuration: AnswersViewController.popoverInsetAnimationDuration, delay: 0.0, options: [.beginFromCurrentState, .curveEaseInOut], animations: {
            self.tableView.contentInset.bottom = AnswersViewController.defaultBottomContentInset
        })
    }

    // MARK:- ImageChoiceInputDelegate Methods

    func cell(_ cell: ImageChoiceInputCell, didSubmitImage image: UIImage) {
        guard let indexPath = cell.indexPath else {
            return
        }

        items.replaceSubrange(indexPath.row...indexPath.row, with: [TranscriptImage(image: image)])
        tableView.reloadRows(at: [indexPath], with: .fade)

        send(AnswersCommand.submit("\(cell.selectedItem)"))
    }
}

//MARK:-

private class TranscriptItem {
    let uuid: String
    let text: String
    let valueType: AnswersValueType?
    let placeholder: String?
    let isUserEntered: Bool
    let isEditing: Bool

    init(text: String) {
        uuid = String(describing: UUID())
        valueType = nil
        placeholder = nil
        isUserEntered = false
        isEditing = false
        self.text = text
    }
    
    init(userEnteredText text: String, valueType: AnswersValueType? = nil, placeholder: String? = nil, isEditing: Bool = false) {
        uuid = String(describing: UUID())
        isUserEntered = true
        self.text = text
        self.valueType = valueType
        self.placeholder = placeholder
        self.isEditing = isEditing
    }

    func preferredHeight(with boundingSize: CGSize, font: UIFont) -> Double {
        let textSize = text.boundingRect(with: boundingSize,
                                         options: .usesLineFragmentOrigin,
                                         attributes: [.font: font],
                                         context: nil).size
        return Double(max(textSize.height, font.lineHeight))
    }
}

// MARK:-

private class TranscriptImage: TranscriptItem {
    let image: UIImage

    init(image: UIImage) {
        // Scale the image down, if necessary.
        let maxImageWidth: CGFloat = 400.0
        var apropos = image
        if image.size.width > maxImageWidth {
            let scalingFactor = maxImageWidth / image.size.width
            apropos = TranscriptImage.scale(image, by: scalingFactor)
        }
        self.image = apropos

        super.init(text: "")
    }

    override func preferredHeight(with boundingSize: CGSize, font: UIFont) -> Double {
        let textHeight = super.preferredHeight(with: boundingSize, font: font)
        return max(textHeight,Double(image.size.height))
    }

    static func scale(_ image: UIImage, by scalingFactor: CGFloat) -> UIImage {
        let targetSize = CGSize.init(width: image.size.width * scalingFactor,
                                     height: image.size.height * scalingFactor)

        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIScreen.main.scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: targetSize))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return scaledImage
    }
}

// MARK:-

private class TranscriptPause: TranscriptItem {

    init(prompt: String) {
        super.init(text: prompt)
    }
}
