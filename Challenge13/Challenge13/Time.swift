//
//  Time.swift
//  Challenge13
//
//  Created by PJ Cook on 04/10/2019.
//  Copyright © 2019 John Lewis plc. All rights reserved.
//

import Foundation

struct Time {
    let days: Int
    let hours: Int
    let minutes: Int
    
    func add(minutes: Int, startOfDay: Time, endOfDay: Time) -> Time {
        var newHours = (minutes - (minutes % 60)) / 60
        var newMinutes = minutes - (newHours * 60)
        var newDays = days
        
        newHours += self.hours
        newMinutes += self.minutes
        
        let timeToEndOfDay = endOfDay - Time(days: 0, hours: newHours, minutes: newMinutes)
        if timeToEndOfDay.hours * 60 + timeToEndOfDay.minutes > minutes {
            newDays += 1
            newHours = newHours - timeToEndOfDay.hours
            newMinutes = newMinutes - timeToEndOfDay.minutes
        }
        
        if newMinutes >= 60 {
            newMinutes -= 60
            newHours += 1
        }
        
        if newHours >= 24 {
            newHours -= 24
            newDays += 1
        }
        
        return Time(days: newDays, hours: newHours, minutes: newMinutes)
    }
    
    public static func - (lhs: Time, rhs: Time) -> Time {
        return Time(days: rhs.days - lhs.days, hours: rhs.hours - lhs.hours, minutes: rhs.minutes - lhs.minutes)
    }
}
