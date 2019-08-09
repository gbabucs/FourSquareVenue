//
//  SuggestedFilter.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct SuggestedFilter : Codable {
    
    let filters : [Filter]?
    let header : String?
    
    enum CodingKeys: String, CodingKey {
        case filters = "filters"
        case header = "header"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        filters = try values.decodeIfPresent([Filter].self, forKey: .filters)
        header = try values.decodeIfPresent(String.self, forKey: .header)
    }
    
}
