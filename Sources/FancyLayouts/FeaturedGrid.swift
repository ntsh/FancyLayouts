import SwiftUI

/**
 The first view becomes the "featured" view which occupies the top half of the screen.
 If the rest of the views count is more than 2. they are arranged in 2 rows.
 Otherwise they are arranged in 1 row.
*/
public struct FeaturedGrid: Layout {
	public init() {}

	public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		proposal.replacingUnspecifiedDimensions()
	}

	public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
		let itemCount = subviews.count
		let rowsCount = itemCount > 3 ? 2 : 1
		let row1ItemCount = Int(floor(Double(itemCount - 1) / Double(rowsCount)))
		let row2ItemCount = itemCount - row1ItemCount - 1

		for (index, subview) in subviews.enumerated() {
			var point = bounds.origin
			var width = bounds.width
			var height = bounds.height / 2
			var yPosition = height
			var xPosition = point.x

			if index != 0 {
				height = height / CGFloat(rowsCount)
				if index <= row1ItemCount {
					width = width / CGFloat(row1ItemCount)
					yPosition = bounds.height / 2
					xPosition = width * CGFloat((index - 1))
				} else {
					width = width / CGFloat(row2ItemCount)
					yPosition = bounds.height / 2 + height
					xPosition = width * CGFloat((index - row1ItemCount - 1))
				}
				point = CGPoint(x: xPosition, y: yPosition)
			}

			subview.place(
				at: point,
				anchor: .topLeading,
				proposal: ProposedViewSize(width: width, height: height)
			)
		}
	}
}

struct FeaturedGrid_Previews: PreviewProvider {
	static var randomColor: Color {
		let colors: [Color] = [.yellow, .green, .purple, .blue, .red, .orange, .gray, .brown, .cyan, .mint]
		return colors.randomElement()!
	}

	static var previews: some View {
		FeaturedGrid {
			ForEach(0 ..< 3) { _ in
				Rectangle()
					.foregroundColor(Self.randomColor)
					.border(Color.black)
			}
		}
		.previewLayout(.fixed(width: 225, height: 400))

		FeaturedGrid {
			ForEach(0 ..< 6) { _ in
				Rectangle()
					.foregroundColor(Self.randomColor)
					.border(Color.black)
			}
		}
		.previewLayout(.fixed(width: 225, height: 400))
	}
}
