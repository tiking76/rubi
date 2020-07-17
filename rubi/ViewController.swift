//
//  ViewController.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/05/18.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit
import JGProgressHUD

protocol AuthenticationControllerProtocol {
    func checkFormStatus()
}

class ViewController: UIViewController {
    
    private var viewModel = mainviewModel()
    
    var text : String = ""
    let api = APIClient()
    
    @IBOutlet weak var inputTextField: UITextView!
    
    @IBOutlet weak var goNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configButton()
        configTextField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func goNext(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
        showLoader(true)
        text = inputTextField.text!
        nextView.context = text
        api.postText = text
        api.postData { (str) in
            DispatchQueue.main.async {
                nextView.resText = str
                self.showLoader(false)
                self.present(nextView, animated: true)
                self.inputTextField.text = ""
            }
        }
    }
    
    //UITextVieの範囲外をタップしたら閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func configButton() {
        view.addSubview(goNextButton)
        goNextButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        goNextButton.setTitle("Tap!", for: .normal)
        goNextButton.frame = CGRect(x: (self.view.frame.size.width / 2) - 150, y: (self.view.frame.size.height / 2) - 50, width: 300, height: 100)
        goNextButton.layer.cornerRadius = 10.0
    }
    
    func configTextField() {
        view.addSubview(inputTextField)
        inputTextField.target(forAction: #selector(textDidChange), withSender: .none)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == inputTextField {
            viewModel.text = sender.text
        }
        checkFormStatus()
    }
}





extension UIViewController {

    static let hud = JGProgressHUD(style: .dark)

    //グラデーションをかけてる bule X white
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemRed.cgColor, UIColor.systemYellow.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

    //オプションで付けたい引数はOptinalで宣言する。
    func showLoader(_ show : Bool, withText text: String? = "Loading") {
        view.endEditing(true)
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
}

extension ViewController : AuthenticationControllerProtocol {
    
    func checkFormStatus() {
        if viewModel.formIsVaild {
            goNextButton.isEnabled = true
            goNextButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }else {
            goNextButton.isEnabled = false
            goNextButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
    }
}


