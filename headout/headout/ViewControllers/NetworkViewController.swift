//
//  NetworkViewController.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import UIKit

class NetworkViewController: BaseViewController {

    @IBOutlet var wifiIcon: UIImageView!
    @IBOutlet var wifiConnectionLabel: SpacedOutLabel!
    
    var isWifiAvailable = false {
        didSet {
            if wifiIcon != nil {
                setup()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    
    func setup() {
        if isWifiAvailable {
            wifiIcon.isHighlighted = false
            wifiConnectionLabel.text = Strings.wifiAvailable
        } else {
            wifiIcon.isHighlighted = true
            wifiConnectionLabel.text = Strings.wifiUnavailable
        }
        wifiConnectionLabel.setTextSpacing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
