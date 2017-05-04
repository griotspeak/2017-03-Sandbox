import UIKit
import PlaygroundSupport

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
        print(#function)

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print(#function)
        return animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)

        let cell = UITableViewCell()
        let animalName = animals[indexPath.row]
        cell.textLabel?.text = animalName
        return cell
    }
}

let view = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 600),
                       style: .plain)
let dataSource = AnimalDataSource(animals: [
    "Cat",
    "Dog",
    "Liger",
    "Moose",
    "Unicorn",
    "Hippo",
    "Elephant",
    "Squirrel"
    ])
view.dataSource = dataSource
PlaygroundPage.current.liveView = view