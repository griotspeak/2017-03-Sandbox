//
//  ViewController.swift
//  SimpleTableView
//
//  Created by TJ Usiyan on 2017/05/04.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    let dataSource: AnimalDataSource = AnimalDataSource(animals: [
        "Dog",
        "Cheetah",
        "Panda",
        "Dove",
        "Hummingbird",
        "Whale",
        "Hippo",
        "Giraffe"
        ])

    var tableView: UITableView {
        return view as! UITableView
    }

    override func loadView() {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = dataSource

        self.view = tableView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("we selected the cell at \(indexPath)")
        let selectedAnimal = dataSource.animals[indexPath.row]
        print("That means that they selected \(selectedAnimal)")
    }
}


class AnimalDataSource : NSObject, UITableViewDataSource {

    let animals: [String]
    init(animals: [String]) {
        self.animals = animals
        super.init()
    }

    override convenience init() {
        self.init(animals: [])
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        let animalName = animals[indexPath.row]
        cell.textLabel?.text = animalName
        return cell
    }
}
