import Foundation
struct CardResponse : Codable {
    var dataCard : [DataCard]?

    enum CodingKeys: String, CodingKey {

        case dataCard = "data"
    }
    
    
    
    
}
