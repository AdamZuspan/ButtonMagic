//
//  ViewController.swift
//  ButtonMagic
//
//  Created by Admin on 9/19/18.
//  Copyright © 2018 MobileAppsCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1Var: UIButton!
    @IBOutlet weak var button2Var: UIButton!
    @IBOutlet weak var button3Var: UIButton!
    @IBOutlet weak var button4Var: UIButton!
    @IBOutlet weak var button5Var: UIButton!
    @IBOutlet weak var changeButtonVar: UIButton!
    @IBOutlet weak var resetButtonVar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeButtonVar.isEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(magicButton(notification:)), name: .magicTime, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(magicButtonReset(notification:)), name: .magicTimeReset, object: nil)
    }

    @objc func magicButton(notification: NSNotification) {
         button1Var.backgroundColor = UIColor.red
         button2Var.backgroundColor = UIColor.red
         button3Var.backgroundColor = UIColor.red
         button4Var.backgroundColor = UIColor.red
         button5Var.backgroundColor = UIColor.red
    }
    
    @objc func magicButtonReset(notification: NSNotification) {
        button1Var.backgroundColor = UIColor.yellow
        button2Var.backgroundColor = UIColor.orange
        button3Var.backgroundColor = UIColor.purple
        button4Var.backgroundColor = UIColor.brown
        button5Var.backgroundColor = UIColor.cyan
    }
    
    @IBAction func changeButtonACT(_ sender: Any) {
        changeButtonVar.isEnabled = false
        resetButtonVar.isEnabled = true
        NotificationCenter.default.post(name: .magicTime, object: nil)
    }
    @IBAction func resetButtonACT(_ sender: Any) {
        resetButtonVar.isEnabled = false
        changeButtonVar.isEnabled = true
        NotificationCenter.default.post(name: .magicTimeReset, object: nil)
    }
    

}

extension Notification.Name {
    static let magicTime = Notification.Name("magicTime")
    static let magicTimeReset = Notification.Name("magicTimeReset")
}

