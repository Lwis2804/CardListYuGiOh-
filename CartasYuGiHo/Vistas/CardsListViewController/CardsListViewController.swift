//
//  CardsListViewController.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 30/10/23.
//

import UIKit

class CardsListViewController: UIViewController {
    
    //MARK: - OUTLETS

    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var cardListTable: UITableView!
    
    //MARK: - VARIABLES
    
    var arrCards: [DataCard] = []
    
    
    //MARK: - LIFE · CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCardTablelist()
        getCardsList()
    }

    //MARK: - FUNCTIONS
    

    private func getCardsList() {
        let cardsWS = Cards_WS()
        cardsWS.getCardResponse { respuesta, error in
            if error == nil {
                self.arrCards = self.getAndSplitCard(with: respuesta?.dataCard ?? [], andType: "Normal Monster")
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
    
    
    
    
     
    func setUpCardTablelist(){
        self.cardListTable.dataSource = self
        self.cardListTable.delegate = self
        self.cardListTable.register(CardListTableViewCell.nib, forCellReuseIdentifier: CardListTableViewCell.identifier)
    }
    
    
    //MARK: - NAVIGATION

    
    
    //MARK: - ACTIONS

    
}
