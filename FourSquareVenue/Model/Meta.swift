//
//  Meta.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct Meta : Codable {
    
    let code : Int?
    let requestId : String?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case requestId = "requestId"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        requestId = try values.decodeIfPresent(String.self, forKey: .requestId)
    }
    
}
