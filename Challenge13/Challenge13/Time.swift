//
//  Time.swift
//  Challenge13
//
//  Created by PJ Cook on 04/10/2019.
//  Copyright © 2019 John Lewis plc. All rights reserved.
//

import Foundation

struct Time {
    enum Errors: Error {
        case cannotAddNumberOfMinutes
    }
    
    let days: Int
    let hours: Int
    let minutes: Int
    
    func add(minutes: Int, startOfDay: Time, endOfDay: Time) throws -> Time {
        var newTime = Time.increment(time: self, minutes: minutes)
        
        if newTime.days > days || (newTime.hours >= endOfDay.hours && newTime.minutes > endOfDay.minutes) {
            newTime = Time.increment(
                time: Time(days: days + 1, hours: startOfDay.hours, minutes: startOfDay.minutes),
                minutes: minutes)
            
//            if (newTime.hours >= endOfDay.hours && newTime.minutes > endOfDay.minutes) {
//                throw Errors.cannotAddNumberOfMinutes
//            }
        }
        
        return newTime
    }
    
    public static func increment(time: Time, minutes: Int) -> Time {
        var days = time.days
        var hours = time.hours
        var minutes = time.minutes + minutes
        
        if minutes > 60 {
            hours += Int(minutes / 60)
            minutes = minutes % 60
        }
        
        if hours >= 24 {
            days += Int(hours / 24)
            hours = hours % 24
        }
        
        return Time(days: days, hours: hours, minutes: minutes)
    }
    
    public static func + (lhs: Time, rhs: Time) -> Time {
        var days = lhs.days + rhs.days
        var hours = lhs.hours + rhs.hours
        var minutes = lhs.minutes + rhs.minutes
        
        if minutes > 60 {
            minutes -= 60
            hours += 1
        }
        
        if hours >= 24 {
            hours -= 24
            days += 1
        }
        
        return Time(days: days, hours: hours, minutes: minutes)
    }
    
    public static func - (lhs: Time, rhs: Time) -> Time {
        var days = lhs.days - rhs.days
        var hours = lhs.hours - rhs.hours
        var minutes = lhs.minutes - rhs.minutes
        
        if minutes < 0 {
            if hours > 0 {
                hours -= 1
                minutes += 60
            } else if days > 0 {
                days -= 1
                hours += 23
                minutes += 60
            }
        }
        
        if hours < 0 {
            if days > 0 {
                days -= 1
                hours += 24
            }
        }
        
        return Time(days: days, hours: hours, minutes: minutes)
    }
}
