//
//  RoundBlackButton.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import UIKit

@IBDesignable
class RoundBlackButton: RoundedButton {
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
    
    override func setup() {
        super.setup()
        backgroundColor = Color.roundBlack
        setTitleColor(Color.spacedLabel, for: .normal)
        titleLabel?.setTextSpacing(spacing: LabelConstants.characterSpacing)
    }
    
}
