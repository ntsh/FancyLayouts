import Foundation

enum LayoutType: String, CaseIterable, Identifiable {
	case featured
	case justified
	case stacked
	case flexible

	var id: Self { self }
}
