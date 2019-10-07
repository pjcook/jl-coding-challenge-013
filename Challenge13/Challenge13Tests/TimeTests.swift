//
//  TimeTests.swift
//  Challenge13Tests
//
//  Created by PJ Cook on 04/10/2019.
//  Copyright © 2019 John Lewis plc. All rights reserved.
//

import XCTest
@testable import Challenge13

class TimeTests: XCTestCase {
    func test_adding_minutes() throws {
        let startOfDay = Time(days: 0, hours: 8, minutes: 0)
        let endOfDay = Time(days: 0, hours: 18, minutes: 0)
        
        let time = Time(days: 0, hours: 8, minutes: 0)
        let newTime = try time.add(minutes: 100, startOfDay: startOfDay, endOfDay: endOfDay)
        
        XCTAssertEqual(newTime.days, 0)
        XCTAssertEqual(newTime.hours, 9)
        XCTAssertEqual(newTime.minutes, 40)
    }

    func test_minutes_rolling_past_endOfDay() throws {
        let startOfDay = Time(days: 0, hours: 8, minutes: 0)
        let endOfDay = Time(days: 0, hours: 18, minutes: 0)
        
        let time = Time(days: 0, hours: 17, minutes: 0)
        let newTime = try time.add(minutes: 100, startOfDay: startOfDay, endOfDay: endOfDay)
        
        XCTAssertEqual(newTime.days, 1)
        XCTAssertEqual(newTime.hours, 9)
        XCTAssertEqual(newTime.minutes, 40)
    }
    
    func test_try_to_add_too_many_minutes() throws {
        let startOfDay = Time(days: 0, hours: 8, minutes: 0)
        let endOfDay = Time(days: 0, hours: 18, minutes: 0)
        
        let time = Time(days: 0, hours: 17, minutes: 0)
        XCTAssertThrowsError(try time.add(minutes: (endOfDay.hours - startOfDay.hours) * 60 + 20, startOfDay: startOfDay, endOfDay: endOfDay))
        XCTAssertThrowsError(try time.add(minutes: 3200, startOfDay: startOfDay, endOfDay: endOfDay))
    }
    
    func test_addition() {
        let startTime = Time(days: 0, hours: 8, minutes: 0)
        let additionTime = Time(days: 0, hours: 3, minutes: 0)
        
        let time = startTime + additionTime
        
        XCTAssertEqual(time.days, 0)
        XCTAssertEqual(time.hours, 11)
        XCTAssertEqual(time.minutes, 0)
    }
    
    func test_addition2() {
        let startTime = Time(days: 0, hours: 8, minutes: 0)
        let additionTime = Time(days: 1, hours: 18, minutes: 0)
        
        let time = startTime + additionTime
        
        XCTAssertEqual(time.days, 2)
        XCTAssertEqual(time.hours, 2)
        XCTAssertEqual(time.minutes, 0)
    }
    
    func test_addition3() {
        let startTime = Time(days: 0, hours: 8, minutes: 50)
        let additionTime = Time(days: 0, hours: 3, minutes: 30)
        
        let time = startTime + additionTime
        
        XCTAssertEqual(time.days, 0)
        XCTAssertEqual(time.hours, 12)
        XCTAssertEqual(time.minutes, 20)
    }
    
    func test_subtraction() {
        let startTime = Time(days: 0, hours: 8, minutes: 0)
        let subtractTime = Time(days: 0, hours: 3, minutes: 0)
        
        let time = startTime - subtractTime
        
        XCTAssertEqual(time.days, 0)
        XCTAssertEqual(time.hours, 5)
        XCTAssertEqual(time.minutes, 0)
    }
    
    func test_subtraction2() {
        let startTime = Time(days: 1, hours: 3, minutes: 0)
        let subtractTime = Time(days: 0, hours: 8, minutes: 0)
        
        let time = startTime - subtractTime
        
        XCTAssertEqual(time.days, 0)
        XCTAssertEqual(time.hours, 19)
        XCTAssertEqual(time.minutes, 0)
    }
    
    func test_subtraction3() {
        let startTime = Time(days: 1, hours: 0, minutes: 0)
        let subtractTime = Time(days: 0, hours: 0, minutes: 40)
        
        let time = startTime - subtractTime
        
        XCTAssertEqual(time.days, 0)
        XCTAssertEqual(time.hours, 23)
        XCTAssertEqual(time.minutes, 20)
    }
    
    func test_subtraction4() {
        let startTime = Time(days: 1, hours: 1, minutes: 0)
        let subtractTime = Time(days: 0, hours: 0, minutes: 40)
        
        let time = startTime - subtractTime
        
        XCTAssertEqual(time.days, 1)
        XCTAssertEqual(time.hours, 0)
        XCTAssertEqual(time.minutes, 20)
    }
}
