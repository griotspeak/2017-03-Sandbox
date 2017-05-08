//
//  ForecastStore.swift
//  WhatsTheWeather
//
//  Created by TJ Usiyan on 2017/05/08.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

enum Result<Payload> {
    case success(Payload)
    case failure(Swift.Error)
}

struct Forecast : Hashable {
    let cityID: Int
    let days: [[String: Any]]
    var dayCount: Int {
        return days.count
    }

    init?(json: Data) {
        guard let object = (try? JSONSerialization.jsonObject(with: json, options: [])) as? [String: Any] else {
            return nil
        }

        self.init(json: object)
    }

    init?(json: [String: Any]) {
        guard let cityDict = json["city"] as? [String: Any],
            let cityID = cityDict["id"] as? Int,
            let list = json["list"] as? [[String: Any]] else {
                return nil
        }

        self.cityID = cityID
        self.days = list
    }

    var hashValue: Int {
        return cityID.hashValue
    }
    static func == (_ lhs: Forecast, _ rhs: Forecast) -> Bool {
        return lhs.cityID == rhs.cityID
    }
}

final class ForecastStore {
    enum Error : Swift.Error {
        case httpError(HTTPURLResponse)
        case jsonDeserializationError
    }

    func fetch16DayForecast(zip: String, country: String, _ completion: @escaping ((Result<Forecast>) -> Void)) {
        let session = URLSession.shared

        let api = OpenWeatherMapAPI(baseURL: OpenWeatherMapAPI.baseURL,
                                         version: .v2_5)
        let method = OpenWeatherMapAPI.Method.forecast16Day(zip: zip, country: country)
        let endpointURL = api.fullURL(method: method)

        let task = session.dataTask(with: endpointURL) { (optionalData, optionalResponse, optionalError) in
            if let data = optionalData {
                guard let forecast = Forecast(json: data) else {
                    completion(.failure(Error.jsonDeserializationError))
                    return
                }

                completion(.success(forecast))

            } else if let response = optionalResponse {
                completion(.failure(Error.httpError(response as! HTTPURLResponse)))
            } else {
                completion(.failure(optionalError!))
            }
        }

        task.resume()
    }
}
