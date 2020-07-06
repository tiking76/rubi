//
//  ViewController.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/05/18.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var textArray : [String] = ["",""]
    var text : String = ""
    var convertedText : String = ""
    let api = APIClient()
    
    @IBOutlet weak var InputTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //UITextVieの範囲外をタップしたら閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let nextView = segue.destination as! ResultViewController
            nextView.argArray = textArray
        }
    }



    @IBAction func RubiButton(_ sender: Any) {
        text = InputTextField.text!
        textArray[0] = text
        api.postText = text
        api.postData { (str) in
            DispatchQueue.main.async {
                self.convertedText = str
                self.textArray[1] = self.convertedText
                self.InputTextField.text = ""
                self.convertedText = ""
            }
        }
    }
}

