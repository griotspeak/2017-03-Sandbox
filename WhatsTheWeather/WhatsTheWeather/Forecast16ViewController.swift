//
//  ViewController.swift
//  WhatsTheWeather
//
//  Created by TJ Usiyan on 2017/05/08.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class Forecast16ViewController: UITableViewController {
    let store = ForecastStore()
    var forecast: Forecast? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetch16DayForecast(zip: "30303",
                                 country: "us") { (result) in
                                    switch result {
                                    case .failure(let error):
                                        print("failed to fetch forecast. Error: \(error)")
                                    case .success(let forecast):
                                        OperationQueue.main.addOperation {
                                            self.forecast = forecast
                                            self.tableView.reloadData()
                                        }
                                    }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast?.dayCount ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "16DayForecastCell", for: indexPath)

        let dictionary = forecast!.days[indexPath.row]
        let temperatureDictionary = dictionary["temp"] as? [String: Any]
        let dayTemp = temperatureDictionary?["day"] as? Double

        cell.textLabel?.text = dayTemp?.description ?? "Wat?!?"

        return cell
    }


}

