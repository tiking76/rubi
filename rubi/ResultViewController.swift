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
    
    @IBOutlet weak var InputtedTextField: UITextView!
    
    @IBOutlet weak var ResultTextField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InputtedTextField.text = argArray[0]
        print(InputtedTextField.text)
        ResultTextField.text = argArray[1]
        print(ResultTextField.text)
    }
    
    
    
}
