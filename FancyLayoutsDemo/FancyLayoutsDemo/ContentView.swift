import SwiftUI
import FancyLayouts

struct ContentView: View {
	@State private var count = 2
	@State private var layout = LayoutType.featured
	@Namespace private var namespace

	private var randomColor: Color {
		let colors: [Color] = [.yellow, .green, .purple, .blue, .red, .orange, .gray, .brown, .cyan, .mint]
		return colors.randomElement()!
	}

	var body: some View {
		VStack(spacing: 0) {
			gridView
				.edgesIgnoringSafeArea(.all)
				.animation(.easeOut, value: count)

			controls
		}
		.animation(.spring(response: 0.4, dampingFraction: 0.5), value: layout)
	}

	@ViewBuilder
	var gridView: some View {
		switch layout {
		case .featured:
			FeaturedGrid {
				gridContent
			}

		case .justified:
			JustifiedGrid {
				gridContent
			}

		case .pip:
			PictureInPictureGrid {
				gridContent
			} featured: {
				Rectangle().foregroundColor(randomColor)
			}

		case .stacked:
			VStack {
				gridContent
			}
		}
	}

	var gridContent: some View {
		ForEach(0 ..< count, id: \.self) { index in
			Rectangle()
				.foregroundColor(randomColor)
				.border(Color.black)
				.id(index)
				.matchedGeometryEffect(id: index, in: namespace)
		}
	}

	var controls: some View {
		HStack {
			Picker(selection: $layout) {
				ForEach(LayoutType.allCases) { layout in
					VStack {
						Text("\(layout.rawValue.uppercased())")
					}
				}
			} label: {
				Text("Choose layout")
			}
			.pickerStyle(.menu)

			Stepper("", value: $count, in: 2...10)
				.padding()
		}
		.background(Material.ultraThin)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
