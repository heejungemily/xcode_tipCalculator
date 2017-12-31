//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Emily Heejung Son on 12/31/17.
//  Copyright © 2017 Emily Heejung Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var defaultTipChanged = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        tipLabel.text = numberFormatter.string(from: NSNumber(value:0))
        totalLabel.text = numberFormatter.string(from: NSNumber(value:0))
        
        let currentDefault = UserDefaults.standard.object(forKey: "newTip") as? Int
        if let index = currentDefault {
            tipControl.selectedSegmentIndex = index
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaultTipChanged {
            let currentDefault = UserDefaults.standard.object(forKey: "newTip") as? Int
            if let index = currentDefault {
                tipControl.selectedSegmentIndex = index
                defaultTipChanged = false
                calculateTip(UISegmentedControl())
            }
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    @IBAction func calculateTip(_ sender: Any) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        let tipPercentages = [0.18,0.2,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
       // numberFormatter.string(from: NSNumber(value:total))
        //numberFormatter.string(from: NSNumber(value:tip))
        tipLabel.text = numberFormatter.string(from: NSNumber(value:tip))
        totalLabel.text = numberFormatter.string(from: NSNumber(value:total))
    }
    
}

