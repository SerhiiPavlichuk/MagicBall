import Foundation

struct MagicAnswer: Codable {
	let question: String?
	let answer: String?
	let type: String?

	enum CodingKeys: String, CodingKey {

		case question = "question"
		case answer = "answer"
		case type = "type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		question = try values.decodeIfPresent(String.self, forKey: .question)
		answer = try values.decodeIfPresent(String.self, forKey: .answer)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}
}
