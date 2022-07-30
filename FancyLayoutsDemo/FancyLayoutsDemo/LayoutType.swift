import Foundation

enum LayoutType: String, CaseIterable, Identifiable {
	case featured
	case justified
	case pip

	var id: Self { self }
}
