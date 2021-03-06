//
//  ViewController.swift
//  Tipper
//
//  Created by Pallav Agarwal on 1/15/20.
//  Copyright © 2020 Pallav Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let anIndex = UserDefaults.standard.integer(forKey: "index")
        tipControl.selectedSegmentIndex = anIndex
        
        billField.text = UserDefaults.standard.string(forKey: "bill")
        
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.1, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(_ sender: Any) {
        print("Tapped")
        view.endEditing(true)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get Bill Amount
        //?? - if anything on the left is not valid, then do what's on the right
        let bill = Double(billField.text!) ?? 0
        UserDefaults.standard.set(bill, forKey: "bill")
        
        //Calculate Tip and Total
        let tipPercentages = [0.1, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    

}

