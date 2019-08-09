//
//  Group.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct Group : Codable {
    
    let items : [Item]?
    let name : String?
    let type : String?
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
        case name = "name"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decodeIfPresent([Item].self, forKey: .items)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
    
}
