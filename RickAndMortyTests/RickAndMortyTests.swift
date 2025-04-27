import Foundation
import Testing

@testable import RickAndMorty

struct RickAndMortyTests {

    @Test
    func decoder_decodesBothCustomAndISO8601() throws {
        struct DateWrapper: Decodable {
            let date: Date
        }
        let decoder = try decoderFromEpisodeService()
        // 1) “MMMM d, yyyy”
        let in1 = #"{"date":"December 2, 2013"}"#.data(using: .utf8)!
        let out1 = try decoder.decode(DateWrapper.self, from: in1)
        let dateComponents = Calendar(identifier: .gregorian).dateComponents([.year, .month, .day], from: out1.date)
        #expect(dateComponents.day == 2)
        #expect(dateComponents.month == 12)
        #expect(dateComponents.year == 2013)
        // 2) ISO 8601 with fractional seconds
        let in2 = #"{"date":"2017-11-10T12:56:33.798Z"}"#.data(using: .utf8)!
        let out2 = try decoder.decode(DateWrapper.self, from: in2)
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = .withFractionalSeconds
        let expected = isoFormatter.date(from: "2017-11-10T12:56:33.798Z")!
        #expect(out2.date == expected)
    }

    private func decoderFromEpisodeService() throws -> JSONDecoder {
        let mirror = Mirror(reflecting: EpisodeService.shared)
        for child in mirror.children {
            if child.label == "decoder", let decoder = child.value as? JSONDecoder {
                return decoder
            }
        }
        fatalError("Could not find decoder")
    }
}
