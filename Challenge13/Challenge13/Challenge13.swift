//
//  Challenge13.swift
//  Challenge13
//
//  Created by PJ Cook on 04/10/2019.
//  Copyright © 2019 John Lewis plc. All rights reserved.
//

import CoreLocation

enum Errors: Error {
    case noHeadOffice
}

struct Challenge13 {
    func run() throws -> Time {
        var places = DataParser.parse(locationData)
//        let numberOfPlaces = places.count
        var currentLocation = CLLocation(latitude: -0.141499, longitude: 51.496466)
        guard let headOffice = places.first(where: { $0.location.coordinate == currentLocation.coordinate }) else {
            throw Errors.noHeadOffice
        }
        
        var orderedVisits = [Place]()
        orderedVisits.append(headOffice)
        places = headOffice.remove(from: places)
        
        while places.count > 0 {
            guard let nearest = currentLocation.nearestLocation(places: places)  else { break }
            currentLocation = nearest.location
            orderedVisits.append(nearest)
            places = nearest.remove(from: places)
        }
        
        let timeToSpendAtLocation = 20
        let speedMPM: Double = 30/60 // Miles per minute
        
        let startOfDay = Time(days: 0, hours: 8, minutes: 0)
        let endOfDay = Time(days: 0, hours: 18, minutes: 0)
        
        var duration = Time(days: 0, hours: 0, minutes: 0)
        
        var lastLocation = orderedVisits.first!
        for i in (1..<orderedVisits.count) {
            let location = orderedVisits[i]
            let distance = location.location.distance(from: lastLocation.location)
            let minutesTravel = Int(distance.miles / speedMPM)
            print("C:\(lastLocation.name), N:\(location.name), D:\(distance.miles), M:\(minutesTravel)")
            lastLocation = location

            duration = try duration.add(minutes: minutesTravel, startOfDay: startOfDay, endOfDay: endOfDay)
            duration = try duration.add(minutes: timeToSpendAtLocation, startOfDay: startOfDay, endOfDay: endOfDay)
        }
        
        return duration
    }
}
