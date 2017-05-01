//
//  ViewController.swift
//  Containers2
//
//  Created by TJ Usiyan on 2017/04/26.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    // it is most idiomatic to configure tab bar and navigation items in `init`
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureTabBarItem()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTabBarItem()
    }

    func configureTabBarItem() {
        tabBarItem.title = "Red!"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

