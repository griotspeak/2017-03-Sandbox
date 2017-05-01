//
//  LonelyViewcontroller.swift
//  StoryboardPlay
//
//  Created by TJ Usiyan on 2017/04/26.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class LonelyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("I'm so lonely!")
        view.backgroundColor = .green
    }

    override func loadView() {

        super.loadView()
        print("finished loading")
    }
}
