//
//  UpdateViewController.swift
//  CoreDataDemo
//
//  Created by Sumit Ghosh on 08/01/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    @IBOutlet var AgentNameTextField: UITextField!
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    var managedObject:RawAgent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AgentNameTextField.text = (managedObject.value(forKey: "agentname")! as! String)
    }

    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let Bool:Bool = CoreDataHelper.sharedInstance.updateRecord(managedObject: managedObject, name: AgentNameTextField.text!)
        
        if(Bool == true){
            self.dismiss(animated: true, completion: nil)
        }else{
          UIAlertController(title: "Sorry", message: "Could not update", preferredStyle: UIAlertControllerStyle.alert)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
