
import Foundation
struct DataCard : Codable {
    var id : Int?
    var name : String?
    var type : String?
    var frameType : String?
    var desc : String?
    var race : String?
    var atk : Int?
    var def : Int?
    var attribute : String?
    var level : Int?
    var archetype : String?
    var card_sets : [Card_sets]?
    var card_images : [Card_images]?
    var card_prices : [Card_prices]?
}
