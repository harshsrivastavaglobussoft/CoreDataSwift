//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Sumit Ghosh on 05/01/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var addButton: UIButton!
    @IBOutlet var dataTable: UITableView!
    @IBOutlet var TextFiled: UITextField!
    
    var TableArray:Array<RawAgent>!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableArray = CoreDataHelper.sharedInstance.fetchAndPrint()
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name(rawValue: "DataSaved"), object: nil)
        self.reloadTable()
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "DataSaved"), object: nil)
    }
    @IBAction func addButtonAction(_ sender: Any) {
        let rand = Int(arc4random_uniform(100))
        CoreDataHelper.sharedInstance.addTask(name: TextFiled.text!, code: Int32(rand))
        TextFiled.text = "";
    
    }
    @objc func reloadTable(){
        TableArray = CoreDataHelper.sharedInstance.fetchAndPrint()
        dataTable.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if TableArray == nil {
            return 0
        }else{
        return TableArray.count
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        let agent:RawAgent = TableArray[indexPath.row]
        cell.textLabel?.text = (agent.value(forKey: "agentname")! as! String)
        return cell;
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let updateVC:UpdateViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        updateVC.managedObject = TableArray[indexPath.row]
        self.present(updateVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let result:Bool =   CoreDataHelper.sharedInstance.deleteRecords(managedObject: TableArray[indexPath.row])
            if(result == true){
                self .reloadTable()
            }else{
            UIAlertController(title: "Sorry", message: "Could not delete", preferredStyle: UIAlertControllerStyle.alert)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

