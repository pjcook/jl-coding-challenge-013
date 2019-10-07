//
//  Challenge13Tests.swift
//  Challenge13Tests
//
//  Created by PJ COOK on 07/10/2019.
//  Copyright © 2019 John Lewis plc. All rights reserved.
//

import XCTest
import CoreLocation
@testable import Challenge13

class Challenge13Tests: XCTestCase {
    func test_run() throws {
        let challenge13 = Challenge13()
        let duration = try challenge13.run()
        
        XCTAssertEqual(duration.days, 32)
        XCTAssertEqual(duration.hours, 8)
        XCTAssertEqual(duration.minutes, 20)
    }
}
