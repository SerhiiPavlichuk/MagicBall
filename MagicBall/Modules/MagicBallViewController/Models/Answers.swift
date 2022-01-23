import Foundation

struct Answers: Codable {
	let magic: MagicAnswer?

	enum CodingKeys: String, CodingKey {

		case magic = "magic"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		magic = try values.decodeIfPresent(MagicAnswer.self, forKey: .magic)
	}
}
