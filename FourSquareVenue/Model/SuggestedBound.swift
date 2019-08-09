//
//  SuggestedBound.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct SuggestedBound : Codable {
    
    let ne : Ne?
    let sw : Sw?
    
    enum CodingKeys: String, CodingKey {
        case ne = "ne"
        case sw = "sw"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ne = try values.decodeIfPresent(Ne.self, forKey: .ne)
        sw = try values.decodeIfPresent(Sw.self, forKey: .sw)
    }
    
}
