//
//  tappticService.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 03/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation
import Alamofire

class TappticService {

    /**
    retrieve json items list

    - returns: completionHandler with optional JsonItems and optional error
    */
    static func getJsonItems(completionHandler: @escaping (JsonItems?, Error?) -> Void) {
        let url = URL(string: "https://dev.tapptic.com/test/json.php")!
        AF.request(url).validate().responseDecodable(of: JsonItems.self) { (response) in
            guard let itemsList = response.value else {
                completionHandler(nil, .none)
                return
            }

            print(itemsList)
            completionHandler(itemsList, nil)
        }
    }

    /**
    retrieve json item details from item name

    - returns: completionHandler with optional JsonItemDetails and optional error
    */
    static func getJsonItemDetails(with name: String, completionHandler: @escaping (JsonItemDetails?, Error?) -> Void) {
        let url = URL(string: "http://dev.tapptic.com/test/json.php?name=\(name)")!
        AF.request(url).validate().responseDecodable(of: JsonItemDetails.self) { (response) in
            guard let itemDetails = response.value else {
                completionHandler(nil, .none)
                return
            }

            print(itemDetails)
            completionHandler(itemDetails, nil)
        }
    }
}
