//
//  URLList.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import Foundation

class VideoPlayer {
    static let shared = VideoPlayer()
    
    fileprivate init() {
        wishlistArray = Array.init(repeating: Wish(), count: urlArray.count)
    }
    let urlArray = [
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487353601/videoplayback_amdsji.mp4",
        "http://res.cloudinary.com/dscs5qleu/video/upload/v1487373441/videoplayback_ui4yho.mp4",
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487374531/videoplayback_obylet.mp4",
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_780/v1487374700/videoplayback_e3zvox.mp4",
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487374852/videoplayback_rvhcga.mp4",
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,g_center,h_1280,w_720/v1487375084/videoplayback_nsrxka.mp4",
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375265/videoplayback_naggi8.mp4",
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375655/videoplayback_tsrez2.mp4",
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375818/videoplayback_awa49f.mp4"
    ]
    
    var playPosition = 0
    var wishlistArray: [Wish]!
    
    func getURLString() -> String? {
        if playPosition < urlArray.count {
            return urlArray[playPosition]
        }
        return nil
    }
    
    func changeWish() -> Bool {
        if playPosition < urlArray.count {
            wishlistArray[playPosition].change()
            return true
        }
        return false
    }
    
    func getWish() -> Wish! {
        if playPosition < urlArray.count {
            return wishlistArray[playPosition]
        }
        return nil
    }
}

struct Wish {
    var isHighlighted = false
    
    mutating func change() {
        isHighlighted = !isHighlighted
    }
}
