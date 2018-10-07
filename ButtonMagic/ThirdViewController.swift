//
//  ThirdViewController.swift
//  ButtonMagic
//
//  Created by Admin on 9/19/18.
//  Copyright © 2018 MobileAppsCompany. All rights reserved.
//

import UIKit

protocol MessagePassingDelegate {
    func passingMessage(message: String)
}
class ThirdViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var toParentButtonVar: UIButton!
    
    @IBOutlet weak var textFieldVar: UITextField!
    
    var messagePassingDelegate: MessagePassingDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldVar.delegate = self
    }
    
    //Make sure No Memory Leaks
    deinit {
        print("DeAllocated Child VC")
    }

    @IBAction func toParentButtonACT(_ sender: Any) {
        //un_Comment to allow free switching of VC to see last text sent
        dismiss(animated: true, completion: nil)
        if textFieldVar.hasText {
            //Set dismiss here to not allow VC pop unless text is typed
            //dismiss(animated: true, completion: nil)
            messagePassingDelegate.passingMessage(message: textFieldVar.text!)
        }
        
    }
    
}
