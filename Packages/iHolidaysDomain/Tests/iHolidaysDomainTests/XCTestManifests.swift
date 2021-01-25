import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(iHolidaysDomainTests.allTests),
    ]
}
#endif
