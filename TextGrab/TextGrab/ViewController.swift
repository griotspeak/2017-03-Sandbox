//
//  ViewController.swift
//  TextGrab
//
//  Created by TJ Usiyan on 2017/05/20.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var submitButton: UIButton!

    var grabbedText: String = "" {
        didSet {
            submitButton.isEnabled = grabbedText.characters.isEmpty == false
        }
    }
    @IBAction func moveToNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "DisplayVC") as! DisplayViewController
        nextVC.text = grabbedText
        show(nextVC, sender: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        grabbedText = textField.text ?? ""
    }
}

extension ViewController : UITextFieldDelegate {
    @IBAction func textValueChanged(_ sender: UITextField) {
        grabbedText = sender.text ?? ""

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if (textField.text?.characters.isEmpty ?? true) {
            // nothing to do
        } else {
            textField.resignFirstResponder()
        }

        return false
    }
}

