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
    func test_adding_minutes() {
        let startOfDay = Time(days: 0, hours: 8, minutes: 0)
        let endOfDay = Time(days: 0, hours: 18, minutes: 0)
        
        let time = Time(days: 0, hours: 8, minutes: 0)
        let newTime = time.add(minutes: 100, startOfDay: startOfDay, endOfDay: endOfDay)
        
        XCTAssertEqual(newTime.days, 0)
        XCTAssertEqual(newTime.hours, 9)
        XCTAssertEqual(newTime.minutes, 40)
    }

}
