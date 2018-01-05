//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Sumit Ghosh on 05/01/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var addButton: UIButton!
    @IBOutlet var dataTable: UITableView!
    @IBOutlet var TextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addButtonAction(_ sender: Any) {
        let rand = Int(arc4random_uniform(100))
        CoreDataHelper.sharedInstance.addTask(name: TextFiled.text!, code: Int32(rand))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

