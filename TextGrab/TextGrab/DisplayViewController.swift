//
//  DisplayViewController.swift
//  TextGrab
//
//  Created by TJ Usiyan on 2017/05/20.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    @IBOutlet var label: UILabel!
    var text: String!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = text
    }
}
