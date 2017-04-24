//
//  ScoreKeeperViewController.swift
//  ScoreTicker
//
//  Created by TJ Usiyan on 2017/04/24.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

typealias Game = (team1Score: Int, team2Score: Int)

class ScoreKeeperViewController: UIViewController {
    var game: Game = (0, 0) {
        didSet {
            updateDisplay()
        }
    }

    @IBOutlet var team1Button: UIButton!
    @IBOutlet var team2Button: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateDisplay()
    }

    @IBAction func incrementTeam1Score(_ sender: UIButton) {
        game.team1Score += 1
    }

    @IBAction func incrementTeam2Score(_ sender: UIButton) {
        game.team2Score += 1
    }

    func updateDisplay() {
        team1Button.setTitle(game.team1Score.description,
                             for: .normal)
        team2Button.setTitle(game.team2Score.description,
                             for: .normal)
    }
}
