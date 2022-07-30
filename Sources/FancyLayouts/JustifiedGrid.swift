import SwiftUI

public struct JustifiedGrid: Layout {
	public init() {}

	public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		proposal.replacingUnspecifiedDimensions()
	}

	public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
		let calculator = JustifiedLayoutCalculator(itemsCount: subviews.count, bounds: bounds)

		for (index, subview) in subviews.enumerated() {
			let frame = calculator.frame(index: index)
			subview.place(
				at: frame.origin,
				anchor: .topLeading,
				proposal: ProposedViewSize(width: frame.width, height: frame.height)
			)
		}
	}
}

struct JustifiedGrid_Previews: PreviewProvider {
	static var randomColor: Color {
		let colors: [Color] = [.yellow, .green, .purple, .blue, .red, .orange, .gray, .brown, .cyan, .mint]
		return colors.randomElement()!
	}

	static var previews: some View {
		JustifiedGrid {
			ForEach(0 ..< 2) { _ in
				Rectangle()
					.foregroundColor(Self.randomColor)
					.border(Color.black)
			}
		}
		.previewLayout(.fixed(width: 225, height: 400))

		JustifiedGrid {
			ForEach(0 ..< 6) { _ in
				Rectangle()
					.foregroundColor(Self.randomColor)
					.border(Color.black)
			}
		}
		.previewLayout(.fixed(width: 225, height: 400))
	}
}
