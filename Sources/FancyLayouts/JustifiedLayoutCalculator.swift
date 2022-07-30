import Foundation

/**
Lays out the items by adding a new row first before adding a new column
In case of uneven number of items, fill the bottom rows before the top rows.

 Some examples:

 0

 0
 1

 0
 1 2

 1 2
 3 4
 5 6 7
 8 9 A

 1 2
 3 4 5
 6 7 8
 9 A B

 1 2 3
 4 5 6
 7 8 9
 A B C D

 0 3 8 F
 1 2 7 E
 4 5 6 D
 9 A B C

 0 1
 2 3
 4 5 6

 0
 1 2
 3 4

 1 4 9
 2 3 8
 5 6 7

 1
 2 3
 4 5

 */

struct JustifiedLayoutCalculator: LayoutCalculator {
	let itemsCount: Int
	let bounds: CGRect

	/// Add a row before adding another column
	/// Fill the top rows in the end
	func frame(index: Int) -> CGRect {
		let rowsCount = Int(ceil(sqrt(Double(itemsCount))))
		let columnsCount = Int(ceil(Double(itemsCount) / Double(rowsCount)))

		let totalWidth = Int(bounds.width)
		let totalHeight = Int(bounds.height)

		let height = totalHeight / rowsCount
		var width = totalWidth
		var itemX = 0
		var itemY = 0

		let rowsNotFull = rowsCount * columnsCount - itemsCount
		let rowsFull = rowsCount - rowsNotFull
		let firstIndexInFullRows = itemsCount - rowsFull * columnsCount

		if index < firstIndexInFullRows {
			let columnsInTheseRows = (itemsCount - (rowsFull * columnsCount)) / rowsNotFull
			let rowIndex =  index / columnsInTheseRows
			let columnIndex = index % columnsInTheseRows
			width = totalWidth / columnsInTheseRows
			itemX = columnIndex * width
			itemY = rowIndex * height
		} else {
			let rowIndex = rowsNotFull + (index - firstIndexInFullRows) / columnsCount
			let columnIndex = (index - firstIndexInFullRows) % columnsCount
			width = totalWidth / columnsCount
			itemX = columnIndex * width
			itemY = rowIndex * height
		}

		return CGRect(x: itemX, y: itemY, width: width, height: height)
	}
}
