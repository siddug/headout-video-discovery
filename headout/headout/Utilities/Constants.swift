//
//  Constants.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import Foundation
import UIKit

struct VideoConstants {
    static let bufferSize = 5.0
}

struct LabelConstants {
    static let characterSpacing: CGFloat = 7
}

struct UIConstants {
    static let centerDiffForReplayButtons: CGFloat = 30
    static let topSpaceForWishButton: CGFloat = 30
    static let rightSpaceForWishButton: CGFloat = 21
    static let leftSpaceForHamburger = UIConstants.rightSpaceForWishButton
    static let wishListMovementInterval = 0.2
    static let offsetForTopConstraint: CGFloat = 20
}

struct SideBarConstants {
    static let imageArray = [Images.skip, Images.wishlist]
    static let colorArray = [Color.sideBarBg, Color.sideBarBg]
    static let animationDuration: CGFloat = 0.2
    static let width: CGFloat = 180
    static let itemBackgroundColor = Color.sideBarBg
}
