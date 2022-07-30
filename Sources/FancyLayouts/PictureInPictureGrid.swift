import SwiftUI

/**
 The featured view is shown in full screen.
 The rest of the content is shown in a horizontal stack at the bottom of the screen
 */
public struct PictureInPictureGrid<Content: View, Featured:View>: View {
	let content: () -> Content
	let featured: () -> Featured

	public init(
		content: @escaping () -> Content,
		featured: @escaping () -> Featured
	) {
		self.content = content
		self.featured = featured
	}

	public var body: some View {
		ZStack(alignment: .bottomLeading) {
			featured()
				.ignoresSafeArea()

			HStack {
				content()
			}
			.frame(height: 150)
			.padding()
		}
	}
}

struct PictureInPictureGrid_Previews: PreviewProvider {
	static var previews: some View {
		PictureInPictureGrid {
			ForEach(0 ..< 3) { _ in
				Rectangle()
					.foregroundColor(.gray)
					.border(.black)
			}
		} featured: {
			Rectangle()
				.foregroundColor(.yellow)
		}
	}
}
