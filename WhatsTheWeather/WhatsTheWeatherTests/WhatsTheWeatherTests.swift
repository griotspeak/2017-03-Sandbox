//
//  WhatsTheWeatherTests.swift
//  WhatsTheWeatherTests
//
//  Created by TJ Usiyan on 2017/05/08.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import WhatsTheWeather

class WhatsTheWeatherTests: XCTestCase {
    func testSimple16DayForecast() {
        let v2_5API = OpenWeatherMapAPI(baseURL: OpenWeatherMapAPI.baseURL, version: .v2_5)
        let method: OpenWeatherMapAPI.Method = .forecast16Day(zip: "94040", country: "us")

        let result = v2_5API.fullURL(method: method)
        let expected = URL(string: "http://api.openweathermap.org/data/2.5/forecast/daily?zip=94040,us")
        XCTAssertEqual(result, expected)
    }
}
