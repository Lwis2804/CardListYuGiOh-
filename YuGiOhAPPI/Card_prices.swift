/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Card_prices : Codable {
	let cardmarket_price : String?
	let tcgplayer_price : String?
	let ebay_price : String?
	let amazon_price : String?
	let coolstuffinc_price : String?

	enum CodingKeys: String, CodingKey {

		case cardmarket_price = "cardmarket_price"
		case tcgplayer_price = "tcgplayer_price"
		case ebay_price = "ebay_price"
		case amazon_price = "amazon_price"
		case coolstuffinc_price = "coolstuffinc_price"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cardmarket_price = try values.decodeIfPresent(String.self, forKey: .cardmarket_price)
		tcgplayer_price = try values.decodeIfPresent(String.self, forKey: .tcgplayer_price)
		ebay_price = try values.decodeIfPresent(String.self, forKey: .ebay_price)
		amazon_price = try values.decodeIfPresent(String.self, forKey: .amazon_price)
		coolstuffinc_price = try values.decodeIfPresent(String.self, forKey: .coolstuffinc_price)
	}

}