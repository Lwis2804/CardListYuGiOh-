//
//  Cards_WS.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 30/10/23.
//

import Foundation

final class Cards_WS {

    //MARK: - BLOQUES

    public typealias blkCardsResponse = (CardResponse?, Error?) -> Void
 
    
    
    func getCardResponse(withHandler: @escaping blkCardsResponse) {
        
        let urlCardResponse = URL(string: "https://db.ygoprodeck.com/api/v7/cardinfo.php") ?? URL(fileURLWithPath: "")
        URLSession.shared.dataTask(with: urlCardResponse) { data, response, error in
            guard let datos = data else { return }
            do {
                let decoder = JSONDecoder()
                let respuesta = try decoder.decode(CardResponse.self, from: datos)
                withHandler(respuesta, nil)
            } catch {
                withHandler(nil,error)
            }
        }.resume()
    }

    func getCardSearch(withSearch search : String, withHandler: @escaping blkCardsResponse) {
        let strSearchWeb = search.addMissingSpaceCharater(from: search)
        let urlCardResponse = URL(string: "https://db.ygoprodeck.com/api/v7/cardinfo.php?name=\(strSearchWeb)") ?? URL(fileURLWithPath: "")
        
        URLSession.shared.dataTask(with: urlCardResponse) { data, response, error in
            guard let datos = data else { return }
            do {
                let decoder = JSONDecoder()
                let respuesta = try decoder.decode(CardResponse.self, from: datos)
                withHandler(respuesta, nil)
            } catch {
                withHandler(nil,error)
            }
        }.resume()
    }
    
    
}

