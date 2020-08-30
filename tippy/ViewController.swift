//
//  ViewController.swift
//  tippy
//
//  Created by Mireya Leon on 8/29/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sliderPercentLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaults.set("Hello World!", forKey: "myString")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaultTip = defaults.integer(forKey: "defaultTip")

        print(defaultTip)
        tipControl.selectedSegmentIndex = defaultTip
        print(tipControl.selectedSegmentIndex)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        print("default:")
        
        // calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // reset slider when segment tapped
        tipSlider.value = 0
        sliderPercentLabel.text = String(format: "%d%%", 0)
        
        // update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func sliderUpdated(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let slideValue = Int(tipSlider.value)
        let slidePercent = Double(slideValue) / 100.0
        print(slidePercent)
        sliderPercentLabel.text = String(format: "%d%%", slideValue)
        
        // calculate tip and total
        let tip = bill * slidePercent
        let total = bill + tip
        
         // update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
               totalLabel.text = String(format: "$%.2f", total)
        
    }
    
}

