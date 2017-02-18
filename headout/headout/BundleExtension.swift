//
//  BundleExtension.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import Foundation

extension Bundle {
    class var releaseVersionNumber: String {
        return main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    class var buildVersionNumber: String {
        return main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
    
    static var BundleIdentifier: String {
        return Bundle.main.bundleIdentifier!
    }
}
