//
//  CartasPenduloViewController.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 06/11/23.
//

import UIKit

class CartasPenduloViewController: UIViewController {

    
    //MARK: - OUTLETS

    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var cardListTable: UITableView!
    
    //MARK: - VARIABLES
    
    var arrCartasPendulo: [DataCard] = []
    
    
    //MARK: - LIFE · CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCartasPendulo()
        getCardsList()
    }

    //MARK: - FUNCTIONS
    

    private func getCardsList() {
        let cardsWS = Cards_WS()
        cardsWS.getCardResponse { respuesta, error in
            if error == nil {
                self.arrCartasPendulo = self.getAndSplitCard(with: respuesta?.dataCard ?? [], andType: "Pendulum Effect Monster")
                DispatchQueue.main.async {
                    self.cardListTable.reloadData()
                }
            }else {
                DispatchQueue.main.async {
                    self.showAlert(WithTitle: "Error", andMessage: "Ocurrio un error en el llamdo a Servicio")
                }
            }
        }
    }
     
    func setUpCartasPendulo(){
        self.cardListTable.dataSource = self
        self.cardListTable.delegate = self
        self.cardListTable.register(CartasPenduloTableViewCell.nib, forCellReuseIdentifier: CartasPenduloTableViewCell.identifier)
    }
    
    
    //MARK: - NAVIGATION

    
    
    //MARK: - ACTIONS

    
}
