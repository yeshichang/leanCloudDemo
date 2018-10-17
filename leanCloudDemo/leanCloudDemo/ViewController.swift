//
//  ViewController.swift
//  leanCloudDemo
//
//  Created by 叶世昌 on 2018/10/17.
//  Copyright © 2018 Luomi. All rights reserved.
//

import UIKit
import LeanCloud

class ViewController: UIViewController {

    var dataArray = [LCObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    @IBOutlet weak var tableView: UITableView!
    
    func loadData() {
        let query = LCQuery(className: "Todo")
        
        query.find { (result) in
            
            switch result {
            case .success(let todos):
                self.dataArray.removeAll()
                for todo in todos {
                    self.dataArray.append(todo)
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "update" {
            let cell = sender as! HomeCell
            let updateVC = segue.destination as! UpdateViewController
           
            updateVC.todo = cell.todo
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeCell
        cell.todo = dataArray[indexPath.row]
        return cell
    }

}

class HomeCell: UITableViewCell {
    
    var todo: LCObject? {
        
        didSet {
            textLabel?.text = todo?["content"]?.stringValue
        }
    }
}
