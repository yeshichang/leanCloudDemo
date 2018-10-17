//
//  AddViewController.swift
//  leanCloudDemo
//
//  Created by 叶世昌 on 2018/10/17.
//  Copyright © 2018 Luomi. All rights reserved.
//

import UIKit
import LeanCloud

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        
        let content = textView.text
        
        let todo = LCObject(className: "Todo")
        
        todo.set("content", value: content!)
        
        todo.save { result in
            switch result {
            case .success:
                print("success")
                self.navigationController?.popViewController(animated: true)
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
