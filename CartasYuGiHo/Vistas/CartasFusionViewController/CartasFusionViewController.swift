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
    
    let search = UISearchController(searchResultsController: nil)
    var isSearchEmpty : Bool {return search.searchBar.text?.isEmpty ?? true}
    var isFiltering : Bool {return search.isActive && !isSearchEmpty}
    var recibeSearch : String = ""
    var arrCartasFusion: [DataCard] = []
    
    
    //MARK: - LIFE · CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCartasFusion()
        setUpSearchBar()
        setUpSearchBarProperties()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCardsList(withSearch: "" )
    }
    
    //MARK: - FUNCTIONS
    

    private func getCardsList(withSearch search : String) {
        self.view.activityStartAnimating(activityColor: .white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        let cardsWS = Cards_WS()
        cardsWS.getCardResponse(withSearch: search) { respuesta, error in
            if error == nil {
                self.arrCartasFusion = self.getAndSplitCard(with: respuesta?.dataCard ?? [], andType: "Fusion Monster")
                DispatchQueue.main.async {
                    self.cardListTable.reloadData()
                    self.view.activityStopAnimating()
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
    
    private func setUpSearchBar() {
        self.search.searchBar.searchTextField.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.searchTextField.placeholder = "Search your Card"
        self.navigationItem.searchController = search
        definesPresentationContext = true
    }
    
    private func setUpSearchBarProperties() {
        search.automaticallyShowsCancelButton = true
        search.automaticallyShowsScopeBar = true
        search.automaticallyShowsSearchResultsController = true
    }
    
    //MARK: - NAVIGATION

    
    
    //MARK: - ACTIONS

    
}
