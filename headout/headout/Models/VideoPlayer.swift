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
    var isHighlighted: Bool
    
    init(videoUrl: String, linkUrl: String, isHighlighted: Bool = false) {
        self.videoUrl = videoUrl
        self.linkUrl = linkUrl
        self.isHighlighted = isHighlighted
    }
    
    func change() {
        isHighlighted = !isHighlighted
    }
}

class VideoPlayer {
    static let shared = VideoPlayer()

    let allUrlArray = [
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487353601/videoplayback_amdsji.mp4", linkUrl: "https://www.headout.com/tour/512/united-states/new-york/wicked"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487373441/videoplayback_ui4yho.mp4", linkUrl: "https://www.headout.com/tour/515/united-states/new-york/matilda-the-musical"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487374531/videoplayback_obylet.mp4", linkUrl: "https://www.headout.com/tour/517/united-states/new-york/the-phantom-of-the-opera"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_780/v1487374700/videoplayback_e3zvox.mp4", linkUrl: "https://www.headout.com/tour/891"), // LV video
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487374852/videoplayback_rvhcga.mp4", linkUrl: "https://www.headout.com/tour/5331"), // LDN video
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,g_center,h_1280,w_720/v1487375084/videoplayback_nsrxka.mp4", linkUrl: "https://www.headout.com/tour/4548/united-states/new-york/the-glass-menagerie"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375265/videoplayback_naggi8.mp4", linkUrl: "https://www.headout.com/tour/519/united-states/new-york/chicago"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375655/videoplayback_tsrez2.mp4", linkUrl: "https://www.headout.com/tour/765/united-states/las-vegas/michael-jackson-one-by-cirque-du-soleil?stage=content"), // LV video
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487375818/videoplayback_awa49f.mp4", linkUrl: "https://www.headout.com/tour/892/united-states/las-vegas/k-by-cirque-du-soleil"), // LV video
        // sample videos
//        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/v1487383842/big_buck_bunny_720p_1mb_gefmrk.mp4", linkUrl: "https://www.headout.com"),
//        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/v1487383842/big_buck_bunny_720p_1mb_gefmrk.mp4", linkUrl: "https://www.headout.com"),
        HeadoutVideo(videoUrl: "http://res.cloudinary.com/dscs5qleu/video/upload/v1487383842/big_buck_bunny_720p_1mb_gefmrk.mp4", linkUrl: "https://www.headout.com")
    ]
    
    var savedUrls = [HeadoutVideo]()
    
    var urlArray: [HeadoutVideo]! {
        return playingSaved ? savedUrls : allUrlArray
    }
    
    var playPosition = 0
    var playingSaved = false {
        didSet {
            if playingSaved {
                savedUrls = allUrlArray.filter({ (video) -> Bool in
                    video.isHighlighted
                })
            }
        }
    }
    
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
            urlArray[playPosition].change()
            return true
        }
        return false
    }
    
    func getWish() -> Bool {
        if playPosition < urlArray.count {
            return urlArray[playPosition].isHighlighted
        }
        return false
    }
}
