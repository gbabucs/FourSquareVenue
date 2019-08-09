//
//  Response.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct Response : Codable {
    
    let groups : [Group]?
    let headerFullLocation : String?
    let headerLocation : String?
    let headerLocationGranularity : String?
    let suggestedBounds : SuggestedBound?
    let suggestedFilters : SuggestedFilter?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case groups = "groups"
        case headerFullLocation = "headerFullLocation"
        case headerLocation = "headerLocation"
        case headerLocationGranularity = "headerLocationGranularity"
        case suggestedBounds = "suggestedBounds"
        case suggestedFilters = "suggestedFilters"
        case totalResults = "totalResults"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        groups = try values.decodeIfPresent([Group].self, forKey: .groups)
        headerFullLocation = try values.decodeIfPresent(String.self, forKey: .headerFullLocation)
        headerLocation = try values.decodeIfPresent(String.self, forKey: .headerLocation)
        headerLocationGranularity = try values.decodeIfPresent(String.self, forKey: .headerLocationGranularity)
        suggestedBounds = try values.decodeIfPresent(SuggestedBound.self, forKey: .suggestedBounds)
        suggestedFilters = try values.decodeIfPresent(SuggestedFilter.self, forKey: .suggestedFilters)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
    
}
