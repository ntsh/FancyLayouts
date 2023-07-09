import SwiftUI
import FancyLayouts

struct ContentView: View {
	@State private var count = 2
	@State private var layout = LayoutType.featured
	@Namespace private var namespace

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
		let chosenLayout = switch layout {
			case .featured:
				AnyLayout(FeaturedGrid())
			case .justified:
				AnyLayout(JustifiedGrid())
			case .stacked:
				AnyLayout(VStackLayout())
			case .flexible:
				AnyLayout(FlexibleStack())
		}

		chosenLayout {
			gridContent
		}
	}

	@ViewBuilder
	var gridViewWithoutAnyLayout: some View {
		switch layout {
		case .featured:
			FeaturedGrid {
				gridContent
			}

		case .justified:
			JustifiedGrid {
				gridContent
			}

		case .stacked:
			VStack {
				gridContent
			}

		case .flexible:
			FlexibleStack {
				gridContent
			}
		}
	}

	var gridContent: some View {
		return ForEach(0 ..< count, id: \.self) { index in
			SampleView()
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
