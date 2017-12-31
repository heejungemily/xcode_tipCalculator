//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Emily Heejung Son on 12/31/17.
//  Copyright © 2017 Emily Heejung Son. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let currentDefault = UserDefaults.standard.object(forKey: "newTip") as? Int
        if let index = currentDefault {
            segmentedControl.selectedSegmentIndex = index
        }
        
    }
    @IBAction func changeDefault(_ sender: Any) {
        let defaultTip = segmentedControl.selectedSegmentIndex
        UserDefaults.standard.set(defaultTip, forKey: "newTip")
        UserDefaults.standard.synchronize()
        let nc = self.navigationController!
        let stack = nc.viewControllers
        let vc = stack.first as! ViewController
        vc.defaultTipChanged = true
        
        
    }
    
    
}

