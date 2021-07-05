//
//  NumberPad.swift
//
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

class NumberPad: UIControl {
    private let containerView = UIView()
    private let numberButtons: [NumberPadButton] = (1...10).map { _ in NumberPadButton() }
    private let backspaceButton = NumberPadButton()
    private let swipeButton = SwipeButton()
    private let buttonSize = CGSize(width: 75.0, height: 65.0)
    var stringValue: String = ""
    
    var allowsFloats: Bool = true {
        didSet {
            updateSwipeActions()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
                
        for row in 0...3 {
            for column in 0...2 {
                let control: UIControl
                if row == 3 {
                    if column == 0 {
                        let button = numberButtons[0]
                        button.setTitle(String(0), for: .normal)
                        button.addTarget(self, action: #selector(NumberPad.numberTapped(_:)), for: .touchUpInside)
                        control = button
                    }
                    else if column == 1 {
                        updateSwipeActions()
                        control = swipeButton
                    }
                    else {
                        backspaceButton.setImage(UIImage(named: "Backspace")?.withRenderingMode(.alwaysTemplate), for: .normal)
                        if traitCollection.userInterfaceStyle == .dark {
                            backspaceButton.imageView?.tintColor = .white
                        }
                        backspaceButton.addTarget(self, action: #selector(NumberPad.backspaceTapped(_:)), for: .touchUpInside)
                        control = backspaceButton
                    }
                }
                else {
                    let number = 3 * (3 - row) - 2 + column
                    let button = numberButtons[number]
                    button.setTitle(String(number), for: .normal)
                    button.addTarget(self, action: #selector(NumberPad.numberTapped(_:)), for: .touchUpInside)
                    control = button
                }
                
                control.frame = CGRect(origin: CGPoint(x: CGFloat(column) * buttonSize.width, y: CGFloat(row) * buttonSize.height), size: buttonSize)
                containerView.addSubview(control)
                
                if row == 0 && column > 0 {
                    let gridLineX = CGFloat(column) * buttonSize.width
                    containerView.layer.addSublayer(GridLine(from: CGPoint(x: gridLineX, y: 0.0), to: CGPoint(x: gridLineX, y: 4.0 * buttonSize.height)))
                }
            }
            
            if row > 0 {
                let gridLineY = CGFloat(row) * buttonSize.height
                containerView.layer.addSublayer(GridLine(from: CGPoint(x: 0.0, y: gridLineY), to: CGPoint(x: 3.0 * buttonSize.width, y: gridLineY)))
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    
    private func updateSwipeActions() {
        swipeButton.removeTarget(self, action: #selector(NumberPad.decimalSelected(_:)), for: .primaryActionTriggered)
        swipeButton.removeTarget(self, action: #selector(NumberPad.negationSelected(_:)), for: [.primaryActionTriggered, .secondaryActionTriggered])
        
        if allowsFloats {
            let decimalAxText = NSLocalizedString("Insert a decimal point", comment: "Accessibility text for the decimal button")
            swipeButton.setPrimaryActionImage(UIImage(named: "Decimal")?.withRenderingMode(.alwaysTemplate), accessibilityDescription: decimalAxText)
            
            let signAxText = NSLocalizedString("Change the number’s sign", comment: "Accessibility text for the number sign change button")
            swipeButton.setSecondaryActionImage(UIImage(named: "Negative Positive")?.withRenderingMode(.alwaysTemplate), accessibilityDescription: signAxText)
            
            swipeButton.addTarget(self, action: #selector(NumberPad.decimalSelected(_:)), for: .primaryActionTriggered)
            swipeButton.addTarget(self, action: #selector(NumberPad.negationSelected(_:)), for: .secondaryActionTriggered)
        }
        else {
            swipeButton.setPrimaryActionImage(UIImage(named: "Negative Positive")?.withRenderingMode(.alwaysTemplate), accessibilityDescription: "Change the number’s sign")
            swipeButton.setSecondaryActionImage(nil, accessibilityDescription: nil)
            swipeButton.addTarget(self, action: #selector(NumberPad.negationSelected(_:)), for: .primaryActionTriggered)
        }
    }
    
    // MARK: Actions
    
    @objc private func numberTapped(_ sender: NumberPadButton) {
        guard let number = numberButtons.firstIndex(of: sender) else {
            return
        }
        
        if allowsFloats || Int(stringValue + String(number)) != nil {
            stringValue += String(number)
            sendActions(for: .valueChanged)
        }
    }
    
    @objc private func decimalSelected(_ sender: SwipeButton) {
        guard !stringValue.contains(".") else {
            return
        }

        if stringValue.count > 0 {
            stringValue += "."
        }
        else {
            stringValue = "0."
        }
        
        sendActions(for: .valueChanged)
    }
    
    @objc private func negationSelected(_ sender: SwipeButton) {
        guard stringValue.count > 0 else {
            return
        }
        
        if stringValue.hasPrefix("-") {
            stringValue.remove(at: stringValue.startIndex)
        }
        else {
            stringValue.insert("-", at: stringValue.startIndex)
        }
        
        sendActions(for: .valueChanged)
    }
    
    @objc private func backspaceTapped(_ sender: NumberPadButton) {
        guard stringValue.count > 0 else {
            return
        }
        
        stringValue.remove(at: stringValue.index(before: stringValue.endIndex))
        sendActions(for: .valueChanged)
    }
    
    // MARK: UIView Methods
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 3.0 * buttonSize.width, height: 4.0 * buttonSize.height)
    }
}

private class GridLine: CAShapeLayer {
    init(from startPoint:CGPoint, to endPoint:CGPoint) {
        super.init()
        backgroundColor = UIColor(white: 168.0 / 255.0, alpha: 1.0).cgColor
        let lineWidth: CGFloat = 1.0 / UIScreen.main.scale
        frame = CGRect(origin: startPoint, size: CGSize(width: max(endPoint.x - startPoint.x, lineWidth), height: max(endPoint.y - startPoint.y, lineWidth)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private class NumberPadButton: UIButton {
    static let highlightColor = UIColor(white: 0, alpha: 0.2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        update()
        titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .thin)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? NumberPadButton.highlightColor : nil
        }
    }
    
    func update() {
        if traitCollection.userInterfaceStyle == .light {
            setTitleColor(.black, for: .normal)
            imageView?.tintColor = .black
        } else if traitCollection.userInterfaceStyle == .dark {
            setTitleColor(.white, for: .normal)
            imageView?.tintColor = .white
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        update()
    }
}

class SwipeButton: UIControl {
    private var panGestureRecognizer: UIPanGestureRecognizer?
    private var tapGestureRecognizer: UITapGestureRecognizer!
    private var panPercent: CGFloat = 0.0
    private var initialTouchPoint: CGPoint? = nil
    private var primaryAccessibilityDescription: String? = nil
    private var secondaryAccessibilityDescription: String? = nil
    
    private let topImageView = UIImageView()
    private let bottomImageView = UIImageView()
    private let container = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SwipeButton.tap(_:)))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.numberOfTapsRequired = 1
        addGestureRecognizer(tapGestureRecognizer)
        
        addSubview(container)
        container.addSubview(topImageView)
        container.addSubview(bottomImageView)
        
        isAccessibilityElement = true
        accessibilityTraits = .button
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.userInterfaceStyle == .dark {
            topImageView.tintColor = .white
            bottomImageView.tintColor = .white
        } else if traitCollection.userInterfaceStyle == .light {
            topImageView.tintColor = .black
            bottomImageView.tintColor = .black
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let horizontalSpacing: CGFloat = topImageView.image != nil ? 12.0 : 0.0
        let scale = 1 + (panPercent * 0.4)
        topImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        topImageView.sizeToFit()
        bottomImageView.sizeToFit()
        
        container.bounds.size.width = max(topImageView.bounds.width, bottomImageView.bounds.width)
        container.bounds.size.height = topImageView.bounds.height + bottomImageView.bounds.height + horizontalSpacing
        
        topImageView.center = container.bounds.center
        topImageView.frame.origin.y = 0
        topImageView.alpha = 0.4 + panPercent
        
        bottomImageView.center = container.bounds.center
        bottomImageView.frame.origin.y = topImageView.frame.maxY + horizontalSpacing
        bottomImageView.alpha = 1 - panPercent
        
        container.center = bounds.center
        let distanceToMid = (horizontalSpacing / 2) + bottomImageView.bounds.midY
        container.center.y = bounds.center.y + (distanceToMid * panPercent)
    }
    
    // MARK: Methods
    
    func setPrimaryActionImage(_ image: UIImage?, accessibilityDescription: String?) {
        if traitCollection.userInterfaceStyle == .dark {
            bottomImageView.tintColor = .white
        } else if traitCollection.userInterfaceStyle == .light {
            bottomImageView.tintColor = .black
        }
        bottomImageView.image = image
        primaryAccessibilityDescription = accessibilityDescription
        generateCustomAccessibilityActions()
        setNeedsLayout()
    }
    
    func setSecondaryActionImage(_ image: UIImage?, accessibilityDescription: String?) {
        if traitCollection.userInterfaceStyle == .dark {
            topImageView.tintColor = .white
        } else if traitCollection.userInterfaceStyle == .light {
            topImageView.tintColor = .black
        }
        topImageView.image = image
        secondaryAccessibilityDescription = accessibilityDescription
        
        if image != nil {
            if panGestureRecognizer == nil {
                panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SwipeButton.pan(_:)))
                addGestureRecognizer(panGestureRecognizer!)
            }
        }
        else{
            if panGestureRecognizer != nil {
                removeGestureRecognizer(panGestureRecognizer!)
                panGestureRecognizer = nil
            }
        }
        
        generateCustomAccessibilityActions()
        setNeedsLayout()
    }
    
    // MARK: Touch Handling
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        backgroundColor = NumberPadButton.highlightColor
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        backgroundColor = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        if initialTouchPoint == nil {
            backgroundColor = nil
        }
    }
    
    // MARK: Actions
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        sendActions(for: .primaryActionTriggered)
    }
    
    @objc func pan(_ sender: UIPanGestureRecognizer) {
        let maxDistance: CGFloat = 20.0
        let touchPoint = sender.location(in: self)
        
        if let initialPoint = initialTouchPoint {
            let distance = max(touchPoint.y - initialPoint.y, 0)
            
            let percentTraveled = abs(distance / maxDistance)
            let clampedPercent =  min(percentTraveled, CGFloat(1))
            
            panPercent = clampedPercent
        }
        
        switch sender.state {
        case .began:
            initialTouchPoint = touchPoint
        case .cancelled, .ended, .failed:
            if panPercent >= 0.95 {
                sendActions(for: .secondaryActionTriggered)
            } else {
                sendActions(for: .primaryActionTriggered)
            }
            
            initialTouchPoint = nil
            panPercent = 0.0
            backgroundColor = nil
        default:
            break
        }
        
        setNeedsLayout()
    }
    
    // MARK: Accessibility
    
    private func generateCustomAccessibilityActions() {
        var actions = [UIAccessibilityCustomAction]()
        if primaryAccessibilityDescription != nil {
            actions.append(UIAccessibilityCustomAction(name: primaryAccessibilityDescription!, target: self, selector: #selector(SwipeButton.primaryAccessibilityAction)))
        }
        
        if secondaryAccessibilityDescription != nil {
            actions.append(UIAccessibilityCustomAction(name: secondaryAccessibilityDescription!, target: self, selector: #selector(SwipeButton.secondaryAccessibilityAction)))
        }
        
        accessibilityCustomActions = actions
    }
    
    @objc func primaryAccessibilityAction() {
        sendActions(for: .primaryActionTriggered)
    }
    
    @objc func secondaryAccessibilityAction() {
        sendActions(for: .secondaryActionTriggered)
    }
}

extension UIControl.Event {
    public static var secondaryActionTriggered: UIControl.Event {
        return .applicationReserved
    }
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
