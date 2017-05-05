import UIKit
import PlaygroundSupport

class AnimalDataSource : NSObject, UITableViewDataSource {

    var animals: [String]
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

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            dataSource.animals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: .automatic)
        case .insert, .none:
            break
        }
    }

    func tableView(_ tableView: UITableView,
                   moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        guard sourceIndexPath != destinationIndexPath else {
            return
        }
        let itemToMove = dataSource.animals.remove(at: sourceIndexPath.row)
        dataSource.animals.insert(itemToMove, at: destinationIndexPath.row)
        print(animals)
    }
}


// MARK: - Delegate

class AnimalViewController : NSObject, UITableViewDelegate {
    let dataSource: AnimalDataSource

    override convenience init() {
        self.init(dataSource: AnimalDataSource())
    }

    init(dataSource: AnimalDataSource) {
        self.dataSource = dataSource
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("we selected the cell at \(indexPath)")
        let selectedAnimal = dataSource.animals[indexPath.row]
        print("That means that they selected \(selectedAnimal)")

    }
}


let view = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 600),
                       style: .plain)

let dataSource = AnimalDataSource(animals: [
    "Dog",
    "Cheetah",
    "Panda",
    "Dove",
    "Hummingbird",
    "Whale",
    "Hippo",
    "Giraffe"
    ])
let controller = AnimalViewController(dataSource: dataSource)

view.dataSource = controller.dataSource
view.delegate = controller
view.isEditing = true
PlaygroundPage.current.liveView = view
