//
//  ViewController.swift
//  SimpleContact
//
//  Created by TJ Usiyan on 2017/04/25.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var age: Int
    var password: String

    init(name: String, age: Int, password: String) {
        self.name = name
        self.age = age
        self.password = password
    }
}

class ViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    var person: Person? = nil

    @IBAction func validateAndStoreInfo() {
        if let name = nameTextField.text,
            let ageString = ageTextField.text,
            let password = passwordTextField.text,
            let age = Int(ageString),
            name.isEmpty == false,
            password.isEmpty == false {

            let newPerson = Person(name: name, age: age, password: password)
            print("person.name: \(newPerson.name)")
            print("person.age: \(newPerson.age)")
            print("person.password: \(newPerson.password)")
            person = newPerson
        } else {
            print("invalid input")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Doing this in two places only to show that we can
        self.ageTextField.delegate = self
        self.passwordTextField.delegate = self

    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return (textField.text?.isEmpty ?? true) == false
    }
}


