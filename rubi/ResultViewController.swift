//
//  ResultViewController.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/05/21.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var context: String = ""
    var resText: String = ""
    
    @IBOutlet weak var inputtedTextField: UITextView!
    
    @IBOutlet weak var resultTextField: UITextView!
    
    @IBOutlet weak var arrowLabel: UILabel!
    
    @IBOutlet weak var backHomeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configUI()
        inputtedTextField.text = context
        resultTextField.text = resText
        
    }
    
    @objc func backHome() {
        dismiss(animated: true, completion: nil)
        inputtedTextField.text = ""
        resultTextField.text = ""
    }
    
    func configUI() {
        configButton()
        configTextField()
        view.addSubview(arrowLabel)
    }
    
    func configButton() {
        view.addSubview(backHomeButton)
        backHomeButton.setTitle("Home", for: .normal)
        backHomeButton.addTarget(self, action: #selector(backHome), for: .touchUpInside)
    }
    
    func configTextField() {
        view.addSubview(inputtedTextField)
        view.addSubview(resultTextField)
    }
    
}
