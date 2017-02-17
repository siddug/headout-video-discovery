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
    
    fileprivate init() { }
    let urlArray = [
        "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487353601/videoplayback_amdsji.mp4"
    ]
    
    var playPosition = 0
    
    func getURLString() -> String? {
        if playPosition < urlArray.count {
            return urlArray[playPosition]
        }
        return nil
    }
}
