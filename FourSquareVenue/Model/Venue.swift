//
//  Venue.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct Venue : Codable {
    
    let categories : [Category]?
    let id : String?
    let location : Location?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
        case id = "id"
        case location = "location"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories = try values.decodeIfPresent([Category].self, forKey: .categories)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
