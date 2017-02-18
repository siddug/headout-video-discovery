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
import FrostedSidebar

class VideoViewController: UIViewController  {
    let player: Player = Player()
    
    @IBOutlet var knowMoreButton: UIButton!
    @IBOutlet var wishlistButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var replayButton: BaseButton!
    
    @IBOutlet var blurrOverlay: UIView!
    @IBOutlet var nextView: UIView!
    
    @IBOutlet var hamburgerButton: UIButton!
    @IBOutlet var wishButtonRightConstraint: NSLayoutConstraint!
    @IBOutlet var wishButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet var hamburgerLeftConstraint: NSLayoutConstraint!
    
    var frostedSidebar: SideBarViewController!
    
    @IBAction func knowMoreButtonTapped(_ sender: UIButton) {
        if let urlString = VideoPlayer.shared.getLinkUrl(), let url = URL.init(string: urlString) {
            let webVC = SFSafariViewController.init(url: url)
            webVC.delegate = self
            self.present(webVC, animated: true, completion: nil)
            player.pause()
        }
    }
    
    @IBAction func hamburgerButtonTapped(_ sender: UIButton) {
        hamburgerButton.isSelected = !hamburgerButton.isSelected
        if !hamburgerButton.isSelected {
            hamburgerLeftConstraint.constant = UIConstants.leftSpaceForHamburger
            frostedSidebar.dismissAnimated(true, completion: nil)
        } else {
            frostedSidebar.showInViewController( self, animated: true)
            view.bringSubview(toFront: hamburgerButton)
            hamburgerLeftConstraint.constant = SideBarConstants.width - hamburgerButton.bounds.width
        }
        UIView.animate(withDuration: UIConstants.wishListMovementInterval) { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.view.bringSubview(toFront: strongSelf.hamburgerButton)
            strongSelf.view.layoutIfNeeded()
        }
    }
    
    @IBAction func replayButtonTapped(_ sender: UIButton) {
        removeOverlayViews()
        player.playFromBeginning()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        skipButtonTapped(sender)
    }
    
    func removeOverlayViews() {
        wishButtonTopConstraint.constant = UIConstants.topSpaceForWishButton
        wishButtonRightConstraint.constant = UIConstants.rightSpaceForWishButton
        view.layoutIfNeeded()
        UIView.animate(withDuration: UIConstants.wishListMovementInterval) { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.blurrOverlay.alpha = 0
            strongSelf.nextView.alpha = 0
            strongSelf.playButton.alpha = 0
        }
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        VideoPlayer.shared.playPosition = (VideoPlayer.shared.playPosition + 1) % VideoPlayer.shared.urlArray.count
        removeOverlayViews()
        if let urlString = VideoPlayer.shared.getVideoUrl(), let url = URL.init(string: urlString) {
            player.setUrl(url)
            wishlistButton.isSelected = VideoPlayer.shared.getWish().isHighlighted
        } else {
            // Open last page
        }
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        removeOverlayViews()
        player.playFromCurrentTime()
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
        addSideBar()
        createBlurredView()
    }

    func addSideBar() {
        frostedSidebar = SideBarViewController.init(itemImages: SideBarConstants.imageArray, colors: SideBarConstants.colorArray, selectionStyle: .single)
        //        var frostedSidebar: FrostedSidebar = FrostedSidebar(images: SideBarConstants.imageArray, colors: SideBarConstants.colorArray, selection
        for (index, _) in SideBarConstants.imageArray.enumerated() {
            frostedSidebar.actionForIndex[index] = { /* actions */ }
        }
        frostedSidebar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBlurredView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurrOverlay.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurrOverlay.addSubview(blurEffectView)
    }
    
    func addPlayer() {
        player.delegate = self
        player.view.frame = view.bounds
        
        addChildViewController(player)
        view.addSubview(player.view)
        player.didMove(toParentViewController: self)
        player.playbackLoops = false
        player.fillMode = AVLayerVideoGravityResizeAspectFill
        player.bufferSize = VideoConstants.bufferSize
        
        view.sendSubview(toBack: player.view)
        
        if let urlString = VideoPlayer.shared.getVideoUrl(), let url = URL.init(string: urlString) {
            player.setUrl(url)
        }
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(playerTap(_:)))
        player.view.addGestureRecognizer(tap)
    }
    
    func playerTap (_ sender: UITapGestureRecognizer) {
        player.pause()
        view.layoutIfNeeded()
        UIView.animate(withDuration: UIConstants.wishListMovementInterval) { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.blurrOverlay.alpha = 1.0
            strongSelf.playButton.alpha = 1.0
            strongSelf.nextView.alpha = 0
        }
//        blurrOverlay.isHidden = false
//        playButton.isHidden = false
    }
}

extension VideoViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        removeOverlayViews()
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
        wishButtonTopConstraint.constant = nextView.frame.minY + replayButton.frame.minY - UIConstants.offsetForTopConstraint
        wishButtonRightConstraint.constant = nextView.frame.minX + nextView.center.x - UIConstants.centerDiffForReplayButtons + wishlistButton.bounds.width / 2
        view.layoutIfNeeded()
        UIView.animate(withDuration: UIConstants.wishListMovementInterval) { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.blurrOverlay.alpha = 1.0
            strongSelf.nextView.alpha = 1.0
            strongSelf.playButton.alpha = 0
        }
    }
    
    func playerWillComeThroughLoop(_ player: Player) {}
}

// MARK:- Player Delegate
extension VideoViewController: FrostedSidebarDelegate {
    func sidebar(_ sidebar: FrostedSidebar, willShowOnScreenAnimated animated: Bool){}
    func sidebar(_ sidebar: FrostedSidebar, didShowOnScreenAnimated animated: Bool){}
    func sidebar(_ sidebar: FrostedSidebar, willDismissFromScreenAnimated animated: Bool) {
        if hamburgerButton.isSelected && frostedSidebar.isCurrentlyOpen {
            hamburgerButtonTapped(hamburgerButton)
        }
    }
    
    func sidebar(_ sidebar: FrostedSidebar, didDismissFromScreenAnimated animated: Bool){}
    func sidebar(_ sidebar: FrostedSidebar, didTapItemAtIndex index: Int){}
    func sidebar(_ sidebar: FrostedSidebar, didEnable itemEnabled: Bool, itemAtIndex index: Int){}
}

