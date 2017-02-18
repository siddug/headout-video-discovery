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
import SafariServices

class VideoViewController: UIViewController  {
    let player: Player = Player()
    
    @IBOutlet var knowMoreButton: RoundBlackButton!
    @IBOutlet var wishlistButton: UIButton!
    
    @IBAction func knowMoreButtonTapped(_ sender: UIButton) {
        // Know more Button Tap. Open web view
        let webVC = SFSafariViewController.init(url: NSURL(string: VideoPlayer.shared.getLinkUrl()!) as! URL)
        webVC.delegate = self
        self.present(webVC, animated: true, completion: nil)
        player.pause()
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        // SKip Button Tap. play next video
        VideoPlayer.shared.playPosition += 1
        if let urlString = VideoPlayer.shared.getVideoUrl(), let url = URL.init(string: urlString) {
            player.setUrl(url)
        } else {
            // Open last page
        }
    }
    @IBAction func wishlistButtonTapped(_ sender: UIButton) {
        // wishlistButtonTapped. Save to a db
        if VideoPlayer.shared.changeWish() {
            sender.isSelected = VideoPlayer.shared.getWish().isHighlighted
        }
    }
    
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
        player.bufferSize = VideoConstants.bufferSize
        
        view.sendSubview(toBack: player.view)
        
        if let urlString = VideoPlayer.shared.getVideoUrl(), let url = URL.init(string: urlString) {
            player.setUrl(url)
        }
    }
}

extension VideoViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        player.playFromCurrentTime()
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

