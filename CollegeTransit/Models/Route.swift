//
//  Route.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/1/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation
import SwiftUI


class TransitSystem: Decodable, Identifiable{
    
    
    let success : Bool?
    let message : String?
    let messages : String?
    let data : Dictionary<String, [Route]>?
}



class Route: Decodable, Identifiable, Comparable{
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.routeShortName == rhs.routeShortName
    }
    
    static func < (lhs: Route, rhs: Route) -> Bool {
        return lhs.routeShortName! < rhs.routeShortName!
    }
    
    
    var id: String?
    var routeShortName: String?
    var routeColor: String?
    var routeServiceLevel: String?

    enum CodingKeys: String, CodingKey {
        case id = "routeName"
        case routeShortName = "routeShortName"
        case routeColor = "routeColor"
        case routeServiceLevel = "routeServiceLevel"
    }
}



