//
//  ViewController.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/05/18.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var api = APIClient()
    @IBOutlet weak var InputViewLabel: UILabel!
    @IBOutlet weak var InputTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func RubiButton(_ sender: Any) {
        api.postHiragana = InputTextField.text!
        api.postData()
        
    }
    
    
}

