//
//  SideBarViewController.swift
//  headout
//
//  Created by varun jindal on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import UIKit
import FrostedSidebar

class SideBarViewController: FrostedSidebar {

    override func viewDidLoad() {
        super.viewDidLoad()

        animationDuration = SideBarConstants.animationDuration
        width = SideBarConstants.width
        itemBackgroundColor = SideBarConstants.itemBackgroundColor
        // Do any additional setup after loading the view.
        view.backgroundColor = Color.white
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
