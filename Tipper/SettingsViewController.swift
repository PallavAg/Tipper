//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Pallav Agarwal on 1/15/20.
//  Copyright © 2020 Pallav Agarwal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var control: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        control.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "index")
    }
    
    @IBAction func newDefault(_ sender: Any) {
        
        let index = control.selectedSegmentIndex
        UserDefaults.standard.set(index, forKey: "index")
        
        
    }
    

}
