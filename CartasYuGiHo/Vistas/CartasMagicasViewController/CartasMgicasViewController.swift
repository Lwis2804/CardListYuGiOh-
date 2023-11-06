//
//  CartasMgicasViewController.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 06/11/23.
//

import UIKit

class CartasMgicasViewController: UIViewController {

    
    //MARK: - OUTLETS

    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var cardListTable: UITableView!
    
    //MARK: - VARIABLES
    
    var arrCartasMagicas: [DataCard] = []
    
    
    //MARK: - LIFE · CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCartasMagicas()
        getCardsList()
    }

    //MARK: - FUNCTIONS
    

    private func getCardsList() {
        let cardsWS = Cards_WS()
        cardsWS.getCardResponse { respuesta, error in
            if error == nil {
                self.arrCartasMagicas = respuesta?.dataCard ?? []
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
     
    func setUpCartasMagicas(){
        self.cardListTable.dataSource = self
        self.cardListTable.delegate = self
        self.cardListTable.register(CartasMagicasTableViewCell.nib, forCellReuseIdentifier: CartasMagicasTableViewCell.identifier)
    }
    
    
    //MARK: - NAVIGATION

    
    
    //MARK: - ACTIONS

    
}
