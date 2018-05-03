//
//  CollectionCell.swift
//  SomeKindOfMonster
//
//  Created by Baby on 3/5/18.
//  Copyright © 2018 Baby. All rights reserved.
//

import UIKit

final class CollectionCell: UICollectionViewCell, ReusableCell, NibInitializable {

    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    private var item: ItemType?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configureWith(item: ItemType) {
        imageView.adjustsImageWhenAncestorFocused = true

        self.item = item
        switch item {
        case let .image(image, caption, isClipped, isRounded):
            imageView.setRounded(isRounded)
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = isClipped
            textLabel.text = caption
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        imageView.setRounded(false)
    }

    // MARK: - UIFocusEnvironment

    override var canBecomeFocused: Bool {
        return true
    }

    // here we set array of preferred initial focusable items in priority order
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [self]
    }

    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        return true
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)

        guard let itemType = item, case let .image(_, _, _, isRounded) = itemType, isRounded else { return }

        if context.nextFocusedView == self {
            imageView.becomeInFocusWith(animationCoordinator: coordinator)
            imageView.addParallaxMotionEffect(tilt: 20, pan: 5)
        } else {
            imageView.resignFocus(animationCoordinator: coordinator)
        }
    }
}
