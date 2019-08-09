//
//  Item.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct Item : Codable {
    
    let referralId : String?
    let venue : Venue?
    
    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case venue = "venue"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        referralId = try values.decodeIfPresent(String.self, forKey: .referralId)
        venue = try values.decodeIfPresent(Venue.self, forKey: .venue)
    }
    
}
