//
//  SecondViewController.swift
//  ButtonMagic
//
//  Created by Admin on 9/19/18.
//  Copyright © 2018 MobileAppsCompany. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelFromChild: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    @IBAction func toChildButtonACT(_ sender: Any) {
        let childVC = storyboard?.instantiateViewController(withIdentifier: "child") as! ThirdViewController
        childVC.messagePassingDelegate = self
        present(childVC, animated: true, completion: nil)
    }
    
    //Check to make sure No Memory Leaks since using Navigation Controller
    deinit {
        print("DeAllocating Parent VC")
    }
}

extension SecondViewController: MessagePassingDelegate {
    
    func passingMessage(message: String) {
        labelFromChild.text = message
    }
    
}
