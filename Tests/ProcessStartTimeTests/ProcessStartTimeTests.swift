import XCTest
@testable import ProcessStartTime

let startTime = Date()

final class ProcessStartTimeTests: XCTestCase {
    func testStartTime() {
        let info = ProcessInfo.processInfo
        
        let a = startTime.timeIntervalSince1970
        let b = info.startTime.timeIntervalSince1970
        let c = info.startTime.timeIntervalSince1970
        
        XCTAssertGreaterThan(a, b)
        XCTAssertEqual(b, c)
        
        let uptime = info.uptime
        XCTAssertEqual(uptime, Date().timeIntervalSince1970 - c, accuracy: 0.1, "")
    }
}
