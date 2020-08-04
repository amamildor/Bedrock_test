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
}
