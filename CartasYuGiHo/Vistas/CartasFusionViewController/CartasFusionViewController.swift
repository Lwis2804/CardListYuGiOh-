//
//  CartasFusionViewController.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 06/11/23.
//

import UIKit

class CartasFusionViewController: UIViewController {
    
    //MARK: - OUTLETS

    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var cardListTable: UITableView!
    
    //MARK: - VARIABLES
    
    var arrCartasFusion: [DataCard] = []
    
    
    //MARK: - LIFE · CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCartasFusion()
        getCardsList()
    }
    
    //MARK: - FUNCTIONS
    

    private func getCardsList() {
        let cardsWS = Cards_WS()
        cardsWS.getCardResponse { respuesta, error in
            if error == nil {
                self.arrCartasFusion = self.getAndSplitCard(with: respuesta?.dataCard ?? [], andType: "Fusion Monster")
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
     
    func setUpCartasFusion(){
        self.cardListTable.dataSource = self
        self.cardListTable.delegate = self
        self.cardListTable.register(CartasFusionTableViewCell.nib, forCellReuseIdentifier: CartasFusionTableViewCell.identifier)
    }
    
    
    //MARK: - NAVIGATION

    
    
    //MARK: - ACTIONS

    
}
