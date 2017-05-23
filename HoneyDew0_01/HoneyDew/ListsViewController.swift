//
//  ListsViewController.swift
//  HoneyDew
//
//  Created by TJ Usiyan on 2017/05/23.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

import Firebase

class ListsViewController : UITableViewController {
    let dataSource = ListsDataSource()
    fileprivate var listsHandle: DatabaseHandle? = nil

    override init(style: UITableViewStyle) {
        super.init(style: style)
        sharedInitWork()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        sharedInitWork()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInitWork()
    }

    private func sharedInitWork() {
        let navItem = navigationItem
        let addListItem = UIBarButtonItem(barButtonSystemItem: .add,
                                          target: self,
                                          action: #selector(ListsViewController.addList))
        navItem.rightBarButtonItem = addListItem
    }


    deinit {
        if let handle = listsHandle {
            self.databaseReference.child(listsPath).removeObserver(withHandle: handle)
        }
    }
}

extension ListsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource

        configureDatabase()
    }

    @objc func addList() {
        let data = List(title: Date().description).dictionaryRepresentation
        databaseReference.child(listsPath).childByAutoId().setValue(data)
    }
}

extension ListsViewController /* Firebase */{
    var user: User {
        if let _user = Auth.auth().currentUser {
            return _user
        } else {
            fatalError("User unexpectedly nill in ListsViewController")
        }
    }

    var listsPath: String {
        return "users/\(user.uid)/my_lists"
    }

    var databaseReference: DatabaseReference {
        return Database.database().reference()
    }

    func configureDatabase() {
        listsHandle = databaseReference.child(listsPath).observe(.childAdded, with: {
            [weak self] (snapshot) in
//            guard let strongSelf = self else { return }
            let oList = List(snapshot: snapshot)

            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                if let list = oList {
                    let index = strongSelf.dataSource.lists.count
                    strongSelf.dataSource.lists.append(list)

                    // this is a naive approach to index path
                    let indexPath = IndexPath(row: index, section: 0)
                    strongSelf.tableView.insertRows(at: [indexPath],
                                                    with: .automatic)
                } else {
                    print("failed to deserialize lists")
                }
            }
        })
    }
}

// MARK: - Data Source

class ListsDataSource: NSObject, UITableViewDataSource {
    var lists: [List] = [List(title: "Hi") ]

    init(lists: [List]) {
        self.lists = lists
    }

    override convenience init() {
        self.init(lists: [])
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellReuseIdentifiers.listsViewCell) else {
            fatalError("failed to dequeue cell with reuse identifier \(Constants.CellReuseIdentifiers.listsViewCell)")
        }
        let list = lists[indexPath.row]
        cell.textLabel?.text = list.title
        return cell
    }
}
