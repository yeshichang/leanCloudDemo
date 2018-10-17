//
//  UpdateViewController.swift
//  leanCloudDemo
//
//  Created by 叶世昌 on 2018/10/17.
//  Copyright © 2018 Luomi. All rights reserved.
//

import UIKit
import LeanCloud

class UpdateViewController: UIViewController {
    
    var todo: LCObject?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = todo?["content"]?.stringValue
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func Delete(_ sender: Any) {
        
        todo?.delete({ (result) in
            switch result {
            case .success:
                self.navigationController?.popViewController(animated: true)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    @IBAction func updatelete(_ sender: Any) {
        
        todo?.set("content", value: textView.text)
        
        todo?.save({ (result) in
            switch result {
            case .success:
                self.navigationController?.popViewController(animated: true)
            case .failure(let error):
                print(error)
            }
        })
    }


}
