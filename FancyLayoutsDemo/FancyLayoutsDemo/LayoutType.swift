import Foundation

enum LayoutType: String, CaseIterable, Identifiable {
	case featured
	case justified
	case stacked

	var id: Self { self }
}
