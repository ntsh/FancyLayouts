import SwiftUI

public struct FlexibleStack: Layout {
	public init() {}

	public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		proposal.replacingUnspecifiedDimensions()
	}

	public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
		let stack = subviews.count > 3 ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
		var anycache = stack.makeCache(subviews: subviews)
		stack.placeSubviews(in: bounds, proposal: proposal, subviews: subviews, cache: &anycache)
	}
}

struct FlexibleStack_Previews: PreviewProvider {
	static var randomColor: Color {
		let colors: [Color] = [.yellow, .green, .purple, .blue, .red, .orange, .gray, .brown, .cyan, .mint]
		return colors.randomElement()!
	}

	static var previews: some View {
		FlexibleStack {
			Color.red
			Color.blue
			Color.yellow
		}
		.previewLayout(.fixed(width: 225, height: 400))

		FlexibleStack() {
			ForEach(0 ..< 6) { _ in
				Rectangle()
					.foregroundColor(Self.randomColor)
					.border(Color.black)
			}
		}
		.previewLayout(.fixed(width: 225, height: 400))
	}
}
