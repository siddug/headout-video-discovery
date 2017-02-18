//
//  SpacedOutLabel.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class SpacedOutLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {
        setTextSpacing(spacing: LabelConstants.characterSpacing, paraSpacing: LabelConstants.paraSpacing)
        textColor = Color.spacedLabel
    }
}
