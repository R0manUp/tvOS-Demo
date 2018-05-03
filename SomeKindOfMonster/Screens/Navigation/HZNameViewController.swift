//
//  HZNameViewController.swift
//  SomeKindOfMonster
//
//  Created by Baby on 3/5/18.
//  Copyright © 2018 Baby. All rights reserved.
//

import UIKit

class HZNameViewController: UIViewController {

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesBegan(presses, with: event)

        guard let press = presses.first else { return }

        switch press.type {
        case .menu:
            print("Menu Press")
        case .playPause:
            print("playPause")
        default:
            print("Pressed: ", press.type)
        }
    }

    @objc func some(_ gestureRecognized: UIGestureRecognizer) {
        print("Menu Press")
    }

    @IBAction func buttonActio(_ sender: UIButton) {
        exit(0);
    }
}
