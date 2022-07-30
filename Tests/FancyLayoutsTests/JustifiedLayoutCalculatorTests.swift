@testable import FancyLayouts
import XCTest

final class JustifiedLayoutCalculatorTests: XCTestCase {
	private let bounds = CGRect(x: 0, y: 0, width: 1000, height: 2000)

	func test1Item() throws {
		let layout = JustifiedLayoutCalculator(itemsCount: 1, bounds: bounds)

		XCTAssertEqual(bounds, layout.frame(index: 0))
	}

	func test2Items() throws {
		let layout = JustifiedLayoutCalculator(itemsCount: 2, bounds: bounds)
		XCTAssertEqual(CGRect(x: 0, y: 0, width: 1000, height: 1000), layout.frame(index: 0))
		XCTAssertEqual(CGRect(x: 0, y: 1000, width: 1000, height: 1000), layout.frame(index: 1))
	}

	func test3Items() throws {
		let layout = JustifiedLayoutCalculator(itemsCount: 3, bounds: bounds)
		XCTAssertEqual(CGRect(x: 0, y: 0, width: 1000, height: 1000), layout.frame(index: 0))
		XCTAssertEqual(CGRect(x: 0, y: 1000, width: 500, height: 1000), layout.frame(index: 1))
		XCTAssertEqual(CGRect(x: 500, y: 1000, width: 500, height: 1000), layout.frame(index: 2))
	}

	func test4Items() throws {
		let layout = JustifiedLayoutCalculator(itemsCount: 4, bounds: bounds)
		XCTAssertEqual(CGRect(x: 0, y: 0, width: 500, height: 1000), layout.frame(index: 0))
		XCTAssertEqual(CGRect(x: 500, y: 0, width: 500, height: 1000), layout.frame(index: 1))
		XCTAssertEqual(CGRect(x: 0, y: 1000, width: 500, height: 1000), layout.frame(index: 2))
		XCTAssertEqual(CGRect(x: 500, y: 1000, width: 500, height: 1000), layout.frame(index: 3))
	}

	func test7Items() throws {
		let bounds = CGRect(x: 0, y: 0, width: 666, height: 999)
		let layout = JustifiedLayoutCalculator(itemsCount: 7, bounds: bounds)
		XCTAssertEqual(CGRect(x: 0, y: 0, width: 333, height: 333), layout.frame(index: 0))
		XCTAssertEqual(CGRect(x: 333, y: 0, width: 333, height: 333), layout.frame(index: 1))
		XCTAssertEqual(CGRect(x: 0, y: 333, width: 333, height: 333), layout.frame(index: 2))
		XCTAssertEqual(CGRect(x: 444, y: 666, width: 222, height: 333), layout.frame(index: 6))
	}

	func test10Items() throws {
		let bounds = CGRect(x: 0, y: 0, width: 666, height: 2000)
		let layout = JustifiedLayoutCalculator(itemsCount: 10, bounds: bounds)
		XCTAssertEqual(CGRect(x: 0, y: 0, width: 333, height: 500), layout.frame(index: 0))
		XCTAssertEqual(CGRect(x: 333, y: 0, width: 333, height: 500), layout.frame(index: 1))
		XCTAssertEqual(CGRect(x: 0, y: 500, width: 333, height: 500), layout.frame(index: 2))
		XCTAssertEqual(CGRect(x: 444, y: 1500, width: 222, height: 500), layout.frame(index: 9))
	}
}
