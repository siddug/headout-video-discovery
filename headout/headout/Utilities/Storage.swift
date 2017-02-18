//
//  Storage.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import Foundation

struct StorageKey {
    static let kURLList = "kURLList"
    static let kWishlist = "kWishlist"
}

class Storage {
    fileprivate static var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    class func store(_ data: Data, forKey key: String) {
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
    }
    
    class func retrieve(forKey key: String) -> Data? {
        return userDefaults.object(forKey: key) as? Data
    }
    
    class func remove(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}

