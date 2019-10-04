//
//  Place.swift
//  Challenge13
//
//  Created by PJ Cook on 04/10/2019.
//  Copyright © 2019 John Lewis plc. All rights reserved.
//

import CoreLocation

struct Place {
    let name: String
    let postcode: String
    let location: CLLocation
}

extension Place {    
    func remove(from places: [Place]) -> [Place] {
        var places = places
        if let index = places.firstIndex(where: { $0.location == location }) {
            places.remove(at: index)
        }
        return places
    }
}
