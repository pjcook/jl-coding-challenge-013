//
//  Extensions.swift
//  Challenge13
//
//  Created by PJ Cook on 04/10/2019.
//  Copyright © 2019 John Lewis plc. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

extension CLLocation {
    func nearestLocation(places: [Place]) -> Place? {
        guard var place = places.first else { return nil }
        var minDistance = place.location.distance(from: self)
        places.forEach {
            let distance = $0.location.distance(from: self)
            if distance < minDistance {
                minDistance = distance
                place = $0
            }
        }
        
        return place
    }
}

extension CLLocationDistance {
    var miles: Double {
        return self / 1609.34
    }
}
