import SwiftUI

struct DotPulseLoadingView: View {
    var dotColor = Color.green

    var body: some View {
        TimelineView(.animation) { timeline in
            HStack {
                ForEach(0..<3) { index in
                    // phase shift each subsequent dot by 0.2s
                    let phase = timeline.date.timeIntervalSinceReferenceDate - (Double(index) * 0.2)
                    // map sin [-1...1] to progress [0...1]
                    let progress = (sin(phase * 2 * .pi / 1.7) + 1) / 2
                    // [0.7...1.3]
                    let scale = 0.7 + (0.6 * progress)
                    // [0.6...1]
                    let opacity = 0.6 + (0.4 * progress)
                    Circle()
                        .fill(dotColor)
                        .frame(width: 10, height: 10)
                        .scaleEffect(scale)
                        .opacity(opacity)
                }
            }
        }
    }
}
