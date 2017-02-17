//
//  ViewController.swift
//  headout
//
//  Created by Siddhartha on 17/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import UIKit
import Player
import YouTubePlayer
import AVFoundation

class ViewController: UIViewController, PlayerDelegate  {
    let player: Player = Player()
    var youTubePlayer: YouTubePlayerView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.player.delegate = self
        self.player.view.frame = self.view.bounds
        
        self.addChildViewController(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParentViewController: self)
        self.player.playbackLoops = true
        self.player.fillMode = AVLayerVideoGravityResizeAspectFill
        self.player.bufferSize = 5
        
        let url = NSURL(string: "http://res.cloudinary.com/dscs5qleu/video/upload/c_fill,h_1280,w_720/v1487353601/videoplayback_amdsji.mp4")
        self.player.setUrl(url as! URL)
 
        
//        self.youTubePlayer = YouTubePlayerView(frame: self.view.bounds)
//        self.youTubePlayer?.delegate = self
//        self.youTubePlayer?.loadVideoID("t4VASf8yeIU")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func playerReady(_ videoPlayer: YouTubePlayerView) {
//        print("ready to play")
//        self.youTubePlayer?.play()
//    }
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        
    }
    
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
        
    }
    
    func playerReady(_ player: Player) {
        self.player.playFromBeginning()
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        print(player.playbackState)
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        print(player.bufferingState)
    }
    
    func playerCurrentTimeDidChange(_ player: Player) {
        print(player.currentTime)
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

