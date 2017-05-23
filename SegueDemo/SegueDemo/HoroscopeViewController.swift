//
//  HoroscopeViewController.swift
//  SegueDemo
//
//  Created by TJ Usiyan on 2017/05/09.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit


class HoroscopeViewController: UIViewController {
    var horoscope: String = "You're gonna die."{
        didSet {
            if horoscope.isEmpty {
                horoscope = "You're gonna die."
            }
        }
    }

    var sign: String!

    @IBOutlet var horoscopeLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        horoscopeLabel.text = horoscope
        navigationItem.title = sign
    }

}
