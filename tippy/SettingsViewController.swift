//
//  SettingsViewController.swift
//  tippy
//
//  Created by Mireya Leon on 8/30/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
          let defaultTip = defaults.integer(forKey: "defaultTip")

              print(defaultTip)
              defaultTipControl.selectedSegmentIndex = defaultTip
    }
    

    @IBAction func setDefaultTip(_ sender: Any) {
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
