//
//  ViewController.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/05/18.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var text : String = ""
    let api = APIClient()
    @IBOutlet weak var InputViewLabel: UILabel!
    @IBOutlet weak var InputTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //api.postHiragana = InputTextField.text!
        api.postData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //UITextVieの範囲外をタップしたら閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        text = InputTextField.text!
        self.view.endEditing(true)
    }

    
    @IBAction func RubiButton(_ sender: Any) {

    }


}

