//
//  ReusableCell.swift
//  SomeKindOfMonster
//
//  Created by Baby on 3/5/18.
//  Copyright © 2018 Baby. All rights reserved.
//

import UIKit

import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UITableView {
    func dequeueReusableCell<Cell: ReusableCell>(withType type: Cell.Type, forRowAt indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue reusable cell with \(Cell.reuseIdentifier) reuse identifier.")
        }

        return cell
    }
}

extension UICollectionView {
    func dequeueReusableCell<Cell: ReusableCell>(withType type: Cell.Type, forItemAt indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue reusable cell with \(Cell.reuseIdentifier) reuse identifier.")
        }

        return cell
    }

    func register<C: ReusableCell & NibInitializable>(cell: C.Type) {
        self.register(C.nib, forCellWithReuseIdentifier: C.reuseIdentifier)
    }
}
