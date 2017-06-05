//
//  FakeDB.swift
//  kofepovkusu
//
//  Created by Suhakou Yauheni on 25/03/2017.
//  Copyright © 2017 kaff.io. All rights reserved.
//

import Foundation

class FakeDB {
    let jsonFileName: String

    init(jsonString: String) {
        self.jsonFileName = jsonString
    }

    func load() -> [[String:String]] {
        print(jsonFileName)
        var coffeeList = [[String:String]]()

        if let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data)

                if let coffeeJson = json as? [[String: Any]] {
                    for coffee in coffeeJson {
                        if let coffeeName = coffee["name"] as? String,
                            let coffeDescription = coffee["description"] as? String,
                            let coffeFullDescription = coffee["full_description"] as? String,
                            let coffeeCountry = coffee["country"] as? String {
                            let coffee = [
                                "name": coffeeName,
                                "description": coffeDescription,
                                "full_description": coffeFullDescription,
                                "country": coffeeCountry
                            ]
                            coffeeList.append(coffee)
                        }
                    }
                } else {
                    print("fucking json is not working")
                }
            } catch {
                print(error.localizedDescription)
                print("Error here")
            }
        }

        return coffeeList
    }
}
