//
//  ViewController.swift
//  SegueDemo
//
//  Created by TJ Usiyan on 2017/05/09.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier else {
            fatalError("Forgot to give segue an identifier")
        }

        print("segueId: \(segueId)")
        let destination = segue.destination as! HoroscopeViewController

        switch segueId {
        case "Gemini":
            destination.horoscope = "You're gonna die *twice*."
        default:
            break
        }
    }

}

