import Foundation

protocol LayoutCalculator {
	var itemsCount: Int { get }
	var bounds: CGRect { get }

	func frame(index: Int) -> CGRect
}
