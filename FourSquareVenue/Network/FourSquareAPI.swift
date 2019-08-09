//
//  FourSquareAPI.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

struct FourSquareAPIConstant {
    static let clientId = "VSVCY2G2DU4LCXDNLRIFVVLHLHCHDRTWVRNQGCPD4RWDXYZR"
    static let clientSecret = "4RLCN3IBHYI5OUNADVKP4HV3XUFE5XAOYMCDKFZQ1NWINZ1U"
    static let version = "20160810"
    static let locale = "en"
}

enum FourSquareAPI {
    case recommended(query: SearchParameter)
}

//--------------------------------------------------------------------------
// MARK: - EndPoint
//--------------------------------------------------------------------------

extension FourSquareAPI: EndPoint {
    
    var baseURL: String {
        return "https://api.foursquare.com/v2"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .recommended:
            return "/venues/explore"
        }
    }
    
    var relativeURL: String {
        return self.baseURL + self.path
    }
    
    var parameters: [String: String] {
        switch self {
        case .recommended(let query):
            var parameters = [
                "v": FourSquareAPIConstant.version,
                "client_id": FourSquareAPIConstant.clientId,
                "client_secret": FourSquareAPIConstant.clientSecret,
                "locale": FourSquareAPIConstant.locale,
                "ll": "\(query.latitude),\(query.longitude)"
            ]
            
            if let radius = query.radius {
                parameters["radius"] = "\(radius)"
            }
            
            return parameters
        }
    }
}
