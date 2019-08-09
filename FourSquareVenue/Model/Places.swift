//
//  Places.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct Places : Codable {
    
    let meta : Meta?
    let response : Response?
    
    enum CodingKeys: String, CodingKey {
        case meta = "meta"
        case response = "response"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        response = try values.decodeIfPresent(Response.self, forKey: .response)
    }
    
}
