//
//  MainCollectionViewController.swift
//  SomeKindOfMonster
//
//  Created by Baby on 3/5/18.
//  Copyright © 2018 Baby. All rights reserved.
//

import UIKit

enum ItemType {
    case image(image: UIImage, caption: String, clipped: Bool, rounded: Bool)
}

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController {

    private let items: [ItemType] = [.image(image: #imageLiteral(resourceName: "Tumbler"), caption: "Not Clipped To Bounds", clipped: false, rounded: false),
                                     .image(image: #imageLiteral(resourceName: "Tumbler"), caption: "Clipped To Bounds", clipped: true, rounded:false),
                                     .image(image: #imageLiteral(resourceName: "Tumbler"), caption: "Rounded", clipped: true, rounded: true)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UICollectionViewDataSource

extension MainCollectionViewController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseIdentifier,
                                                      for: indexPath) as! CollectionCell
        let item = items[indexPath.row]
        cell.configureWith(item: item)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MainCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowDetails", sender: nil)
    }
}

