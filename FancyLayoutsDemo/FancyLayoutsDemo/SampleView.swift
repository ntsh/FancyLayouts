import SwiftUI

struct SampleView: View {
	private var randomColor: Color {
		let colors: [Color] = [.yellow, .green, .purple, .blue, .red, .orange, .gray, .brown, .cyan, .mint]
		return colors.randomElement()!
	}

	var body: some View {
		let _ = Self._printChanges()

		Rectangle()
			.foregroundColor(randomColor)
	}
}

#Preview {
	SampleView()
}
