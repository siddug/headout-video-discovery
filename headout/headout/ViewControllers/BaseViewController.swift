//
//  BaseViewController.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var reachability:Reachability!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Network Reachability Notification check
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged), name: ReachabilityChangedNotification, object: nil)
        
        self.reachability = Reachability.init()
        do {
            try self.reachability.startNotifier()
        } catch {
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: ReachabilityChangedNotification, object: nil)
    }
    
    //MARK:- Network Check
    func reachabilityChanged(notification:Notification) {
        let reachability = notification.object as! Reachability
        if let networkVC: NetworkViewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NetworkViewControllerIdentifier") as? NetworkViewController {
            networkVC.isWifiAvailable = false
            if reachability.isReachable {
                if reachability.isReachableViaWiFi {
                    print("Reachable via Wifi")
                    networkVC.isWifiAvailable = true
                } else {
                    print("Reachable via Cellular")
                }
            } else {
                print("Network not reachable")
            }
            if self.isKind(of: VideoViewController.self) && !networkVC.isWifiAvailable {
                present(networkVC, animated: true, completion: nil)
            } else if self.isKind(of: NetworkViewController.self) && networkVC.isWifiAvailable {
                (self as! NetworkViewController).isWifiAvailable = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                    guard let strongSelf = self else {return}
                    strongSelf.dismiss(animated: true, completion: nil)
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
