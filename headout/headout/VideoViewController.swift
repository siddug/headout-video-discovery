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

class VideoViewController: UIViewController  {
    let player: Player = Player()
//    var youTubePlayer: YouTubePlayerView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPlayer() {
        player.delegate = self
        player.view.frame = view.bounds
        
        addChildViewController(player)
        view.addSubview(player.view)
        player.didMove(toParentViewController: self)
        player.playbackLoops = true
        player.fillMode = AVLayerVideoGravityResizeAspectFill
        player.bufferSize = 5
        
        if let urlString = VideoPlayer.shared.getURLString(), let url = URL.init(string: urlString) {
            player.setUrl(url)
        }
    }
}

// MARK:- Player Delegate
extension VideoViewController: PlayerDelegate {
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {}
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {}
    
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
    
    func playerWillComeThroughLoop(_ player: Player) {}
}

