//
//  Extension.swift
//  SomeKindOfMonster
//
//  Created by Baby on 3/5/18.
//  Copyright © 2018 Baby. All rights reserved.
//

import UIKit

extension UIImageView {
    func setRounded(_ isRounded: Bool) {
        self.layer.cornerRadius = isRounded ? self.frame.height / 2.0 : 0.0
        self.clipsToBounds = isRounded ? true : false
    }
}

extension UIView {
    func becomeInFocusWith(animationCoordinator: UIFocusAnimationCoordinator) {
        // To match system timing and ensure smooth transition
        animationCoordinator.addCoordinatedAnimations({
            self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: nil)
    }

    func resignFocus(animationCoordinator: UIFocusAnimationCoordinator) {
        animationCoordinator.addCoordinatedUnfocusingAnimations({ _ in
            self.transform = .identity
        }, completion: {
            self.removeParallaxEffect()
        })
    }

    func addParallaxMotionEffect(tilt: CGFloat, pan: CGFloat) {
        func toRadians(_ degrees: Double) -> Double {
            return (degrees * (.pi / 2)) / 180
        }

        let shiftX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        shiftX.minimumRelativeValue = -pan
        shiftX.maximumRelativeValue = pan

        let shiftY = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        shiftY.minimumRelativeValue = -pan
        shiftY.maximumRelativeValue = pan

        let tiltX = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.y", type: .tiltAlongVerticalAxis)
        tiltX.minimumRelativeValue = toRadians(Double(-tilt))
        tiltX.maximumRelativeValue = toRadians(Double(tilt))

        let tiltY = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.x", type: .tiltAlongHorizontalAxis)
        tiltY.minimumRelativeValue = toRadians(Double(-tilt))
        tiltY.maximumRelativeValue = toRadians(Double(tilt))

        let motionGroup = UIMotionEffectGroup()
        motionGroup.motionEffects = [tiltX, tiltY, shiftX, shiftY]

        addMotionEffect(motionGroup)
    }

    private func removeParallaxEffect() {
        self.motionEffects = []
    }
}
