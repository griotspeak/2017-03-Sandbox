//
//  SignInViewController.swift
//  HoneyDew
//
//  Created by TJ Usiyan on 2017/05/22.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

import Firebase
import GoogleSignIn

@objc(SignInViewController)
class SignInViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var signInButton: GIDSignInButton!
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self

        GIDSignIn.sharedInstance().signInSilently()
        handle = Auth.auth().addStateDidChangeListener { (auth, oUser) in
            if oUser != nil {
                self.performSegue(withIdentifier: Constants.Segues.signInToHoneyDew, sender: nil)
            }
        }
    }

    deinit {
        if let _handle = handle {
            Auth.auth().removeStateDidChangeListener(_handle)
        }
    }
}
