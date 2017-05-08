//
//  OpenWeatherMapAPI.swift
//  WhatsTheWeather
//
//  Created by TJ Usiyan on 2017/05/08.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

struct OpenWeatherMapAPI {
    static var baseURL: URL {
        return URL(string: "http://api.openweathermap.org/data")!
    }

    let baseURL: URL
    let version: Version

    static var _apiKey: String? = nil

    static var apiKey: String {
        if let back = _apiKey {
            return back
        }

        let bundle = Bundle.main
        guard let jsonURL = bundle.url(forResource: "Private",
                                       withExtension: "json") else {
                                        fatalError("Could not find `Private.json`. API key can not be loaded.")
        }

        do {
            let jsonData = try Data(contentsOf: jsonURL)
            guard let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: String],
                let back = jsonObject["OpenWeatherAPIKey"] else {
                    fatalError("`Private.json` is invalid or empty")
            }
            _apiKey = back
            return back

        } catch {
            fatalError("Could not load `Private.json` from file. \nError\(error)")
        }
    }

    init(baseURL: URL, version: Version) {
        self.baseURL = baseURL
        self.version = version
    }

    func fullURL(method: Method) -> URL {
        let baseWithVersion = baseURL.appendingPathComponent(version.urlPathComponent)

        var components = URLComponents(url: baseWithVersion.appendingPathComponent(method.urlPathComponent), resolvingAgainstBaseURL: true)!
        components.queryItems = method.queryItems
        components.queryItems?.append(URLQueryItem(name: "APPID", value: OpenWeatherMapAPI.apiKey))
        guard let back = components.url else {
            fatalError("Failed to create full URL from components: \(components)")
        }

        return back
    }


}

extension OpenWeatherMapAPI {
    enum Version {
        case v2_5
        case v3

        var urlPathComponent: String {
            switch self {
            case .v2_5:
                return "2.5"
            case .v3:
                return "v3"

            }
        }
    }

    enum Method {
        case forecast16Day(zip: String, country: String)
        case forecast3Day(zip: String, country: String)

        var urlPathComponent: String {
            switch self {
            case .forecast16Day:
                return "/forecast/daily"
            case .forecast3Day:
                return "/forecast"
            }
        }

        var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []

            switch self {
            case .forecast16Day(let zip, let country), .forecast3Day(let zip, let country):
                items = [
                    URLQueryItem(name: "zip", value: "\(zip),\(country)")
                ]
            }
            
            return items
        }
    }
}
