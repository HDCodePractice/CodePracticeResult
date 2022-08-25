//
//  ImageChooser.swift
//
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

protocol ImageChooserDelegate {

    func imageChooser(_ chooser: ImageChooser, didSelect image: UIImage)
}

// MARK:-

class ImageChooser : UICollectionViewController {

    private let cellIdentifier = String(describing: ImageChooserCell.self)
    private let defaultItemSize = CGSize(width: 100, height: 100)
    private var layout: UICollectionViewFlowLayout!

    public var images: [UIImage] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    public var itemSize: CGSize {
        get {
            return layout.itemSize
        }
        set (newSize) {
            layout.itemSize = newSize
        }
    }

    public var selectionColor: UIColor = {
        var color = UIColor(red: 52/255, green: 120/255, blue: 246/255, alpha: 1)
        if #available(iOS 13.0, *) {
            color = UIColor.systemBlue
        }
        return color
    }()

    public var delegate: ImageChooserDelegate?

    public var selectedIndexPath: IndexPath? {
        return collectionView?.indexPathsForSelectedItems?.first
    }

    // MARK:-

    public init() {
        layout = UICollectionViewFlowLayout()
        layout.itemSize = defaultItemSize
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.sectionInset = .zero

        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(ImageChooserCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    // MARK:- UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        if let imageCell = cell as? ImageChooserCell {
            imageCell.image = images[indexPath.item]
            imageCell.selectionColor = selectionColor
        }
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.imageChooser(self, didSelect: images[indexPath.item])
    }
}

// MARK:-

class ImageChooserCell : UICollectionViewCell {

    private var imageView: UIImageView!

    public var image: UIImage? {
        didSet {
            imageView?.image = image
        }
    }

    public var selectionColor: UIColor?

    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = selectionColor
            } else {
                backgroundColor = .clear
            }
        }
    }

    // MARK:-

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear

        self.imageView = UIImageView(frame: self.bounds)
        self.imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

