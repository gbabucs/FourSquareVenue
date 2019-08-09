//
//  Sw.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct Sw : Codable {
    
    let lat : Float?
    let lng : Float?
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lng = try values.decodeIfPresent(Float.self, forKey: .lng)
    }
    
}
