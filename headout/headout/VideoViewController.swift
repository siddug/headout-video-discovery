//
//  VideoViewController.swift
//  headout
//
//  Created by Siddhartha on 17/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import UIKit
import Player
import YouTubePlayer
import AVFoundation

class VideoViewController: UIViewController, PlayerDelegate  {
    let player: Player = Player()
//    var youTubePlayer: YouTubePlayerView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player.delegate = self
        player.view.frame = view.bounds
        
        addChildViewController(player)
        view.addSubview(player.view)
        player.didMove(toParentViewController: self)
        player.playbackLoops = true
        player.fillMode = AVLayerVideoGravityResizeAspectFill
        player.bufferSize = 5
        
        let url = NSURL(string: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487353601/videoplayback_amdsji.mp4")
        player.setUrl(url as! URL)
 
        
//        youTubePlayer = YouTubePlayerView(frame: view.bounds)
//        youTubePlayer?.delegate = self
//        youTubePlayer?.loadVideoID("t4VASf8yeIU")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func playerReady(_ videoPlayer: YouTubePlayerView) {
//        print("ready to play")
//        youTubePlayer?.play()
//    }
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        
    }
    
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
        
    }
    
    func playerReady(_ player: Player) {
        player.playFromBeginning()
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        print(player.playbackState)
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
//        print(player.bufferingState)
    }
    
    func playerCurrentTimeDidChange(_ player: Player) {
//        print(player.currentTime)
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
        print("restarting")
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
        print("playback end")
    }
    
    func playerWillComeThroughLoop(_ player: Player) {
        
    }

}

