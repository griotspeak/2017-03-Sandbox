//
//  ViewController.swift
//  Async
//
//  Created by TJ Usiyan on 2017/05/05.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textView: UILabel {
        return view as! UILabel
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let libraryURL = URL(string: "https://tiy-todo-angular.herokuapp.com/get-all-books.json") else {
            fatalError("failed to create URL")
        }
        var request = URLRequest(url: libraryURL)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { (data,responce,error) in
            if error != nil {
                print("error")
            } else {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

                        OperationQueue.main.addOperation {
                            print("updating label")
                            self.textView.text = String(describing: json)
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            }
        }
        
        task.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

