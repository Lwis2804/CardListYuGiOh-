/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data : Codable {
	let id : Int?
	let name : String?
	let type : String?
	let frameType : String?
	let desc : String?
	let race : String?
	let archetype : String?
	let card_sets : [Card_sets]?
	let card_images : [Card_images]?
	let card_prices : [Card_prices]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case type = "type"
		case frameType = "frameType"
		case desc = "desc"
		case race = "race"
		case archetype = "archetype"
		case card_sets = "card_sets"
		case card_images = "card_images"
		case card_prices = "card_prices"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		frameType = try values.decodeIfPresent(String.self, forKey: .frameType)
		desc = try values.decodeIfPresent(String.self, forKey: .desc)
		race = try values.decodeIfPresent(String.self, forKey: .race)
		archetype = try values.decodeIfPresent(String.self, forKey: .archetype)
		card_sets = try values.decodeIfPresent([Card_sets].self, forKey: .card_sets)
		card_images = try values.decodeIfPresent([Card_images].self, forKey: .card_images)
		card_prices = try values.decodeIfPresent([Card_prices].self, forKey: .card_prices)
	}

}