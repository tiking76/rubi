//
//  ResultViewController.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/05/21.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var argArray : [String]!
    
    @IBOutlet weak var InputedTextField: UITextView!
    
    @IBOutlet weak var ResultTextField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InputedTextField.text = argArray[0]
        ResultTextField.text = argArray[1]
    }
    
    
    
}
