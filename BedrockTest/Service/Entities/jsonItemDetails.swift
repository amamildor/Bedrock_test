//
//  jsonItemDetails.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 03/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation

struct JsonItemDetails: Decodable {
    let name: String
    let text: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case name
        case text
        case imageURL = "image"
    }
}
