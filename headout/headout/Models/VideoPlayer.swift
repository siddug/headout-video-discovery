//
//  URLList.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import Foundation

class HeadoutVideo {
    var videoUrl: String
    var linkUrl: String
    
    init(videoUrl: String, linkUrl: String) {
        self.videoUrl = videoUrl
        self.linkUrl = linkUrl
    }
}

class VideoPlayer {
    static let shared = VideoPlayer()

    fileprivate init() {
        wishlistArray = Array.init(repeating: Wish(), count: urlArray.count)
    }

    let urlArray = [
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487353601/videoplayback_amdsji.mp4", linkUrl: "https://www.headout.com/tour/512/united-states/new-york/wicked"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487373441/videoplayback_ui4yho.mp4", linkUrl: "https://www.headout.com/tour/515/united-states/new-york/matilda-the-musical"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487374531/videoplayback_obylet.mp4", linkUrl: "https://www.headout.com/tour/517/united-states/new-york/the-phantom-of-the-opera"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_780/v1487374700/videoplayback_e3zvox.mp4", linkUrl: ""),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487374852/videoplayback_rvhcga.mp4", linkUrl: ""),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,g_center,h_1280,w_720/v1487375084/videoplayback_nsrxka.mp4", linkUrl: ""),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375265/videoplayback_naggi8.mp4", linkUrl: ""),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375655/videoplayback_tsrez2.mp4", linkUrl: ""),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375818/videoplayback_awa49f.mp4", linkUrl: "")
    ]
    
    var playPosition = 0
    var wishlistArray: [Wish]!
    
    func getVideoUrl() -> String? {
        if playPosition < urlArray.count {
            return urlArray[playPosition].videoUrl
        }
        return nil
    }
    
    func getLinkUrl() -> String? {
        if playPosition < urlArray.count {
            return urlArray[playPosition].linkUrl
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
