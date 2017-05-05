import Foundation


var shouldWait = true
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
//                    dataSource.list = <transformed json>
//                    tableView.reloadData()
                }

                print(String(describing: json))


                let firstDictionary = json[0]
                let author = firstDictionary["author"] as? String



            }
            catch {
                print(error)
            }
            shouldWait = false
        }
    }
}

task.resume()

while shouldWait {
}
