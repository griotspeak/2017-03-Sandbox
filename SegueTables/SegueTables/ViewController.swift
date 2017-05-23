//
//  ViewController.swift
//  SegueTables
//
//  Created by TJ Usiyan on 2017/05/09.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
    var dataSource = HoroscopeDataSource()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Choose your sign"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        dataSource.registerCells(with: tableView)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (sign, message) = dataSource.signs[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let destination = storyboard.instantiateViewController(withIdentifier: "HoroscopeViewController") as! HoroscopeViewController

        destination.horoscope = message ?? "You're gonna die."
        destination.sign = sign
        show(destination, sender: self)
    }
}

class HoroscopeDataSource : NSObject, UITableViewDataSource {
    static var standardCellIdentifier: String = "StandardCell"

    func registerCells(with tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: HoroscopeDataSource.standardCellIdentifier)
    }

    let signs: [(String, String?)] = [
        ("Aries", nil),
        ("Taurus", nil),
        ("Gemini", "You're gonna die twice."),
        ("Cancer", nil),
        ("Leo", nil),
        ("Virgo", nil),
        ("Libra", nil),
        ("Scorpio", nil),
        ("Sagittarius", nil),
        ("Capricorn", nil),
        ("Aquarius", nil),
        ("Pisces", nil)]

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HoroscopeDataSource.standardCellIdentifier) else {
            fatalError("failed to dequeue cell with identifier \(HoroscopeDataSource.standardCellIdentifier)")
        }
        cell.textLabel?.text = signs[indexPath.row].0
        return cell
    }
}

