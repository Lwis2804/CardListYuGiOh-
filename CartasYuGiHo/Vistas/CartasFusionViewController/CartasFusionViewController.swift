//
//  CartasFusionViewController.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 06/11/23.
//

import UIKit

class CartasFusionViewController: UIViewController {
    
    //MARK: - O U T L E T S

    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var cardListTable: UITableView!
    
    //MARK: - V A R I A B L E S
    
    let search = UISearchController(searchResultsController: nil)
    var isSearchEmpty : Bool {return search.searchBar.text?.isEmpty ?? true}
    var isFiltering : Bool {return search.isActive && !isSearchEmpty}
    var recibeSearch : String = ""
    var arrCartasFusion: [DataCard] = []
    var arrCardFilter: [DataCard] = []
    var arrMonster: [DataCard]? 
    
    
    //MARK: - L I F E · C Y C L E
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCartasFusion()
        setUpSearchBar()
        setUpSearchBarProperties()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCardsList()
    }
    //MARK: - W E B · S E R V I C E
    private func getCardsList() {
        self.view.activityStartAnimating(activityColor: .white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        let cardsWS = Cards_WS()
        cardsWS.getCardResponse(withHandler: { [weak self ]respuesta, error in
            guard let self = self else { return }
            if error == nil {
                self.arrMonster = self.getAndSplitCard(with: respuesta?.dataCard ?? [], andType: "Fusion Monster")
                self.arrCartasFusion.removeAll()
                DispatchQueue.main.async {
                    self.cardListTable.reloadData()
                    self.view.activityStopAnimating()
                }
            }else {
                DispatchQueue.main.async {
                    self.showAlert(WithTitle: "Error", andMessage: "Ocurrio un error en el llamdo a Servicio")
                    self.view.activityStopAnimating()
                    self.cardListTable.reloadData()
                }
            }
        })
    }
    //MARK: - S E T · U P · V I E W
    func setUpCartasFusion(){
        self.cardListTable.dataSource = self
        self.cardListTable.delegate = self
        self.cardListTable.register(CartasFusionTableViewCell.nib, forCellReuseIdentifier: CartasFusionTableViewCell.identifier)
    }
    
    private func setUpSearchBar() {
        search.searchResultsUpdater = self
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
}
