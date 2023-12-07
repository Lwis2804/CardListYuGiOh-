//
//  CardsListViewController.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 30/10/23.
//

import UIKit

class CardsListViewController: UIViewController {
    
    //MARK: - O U T L E T S
    
    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var cardListTable: UITableView!
    
    //MARK: - V A R I A B L E S
    let search = UISearchController(searchResultsController: nil)
    var isSearchEmpty : Bool {return search.searchBar.text?.isEmpty ?? true}
    var isFiltering : Bool {return search.isActive && !isSearchEmpty}
    var recibeSearch : String = ""
    var arrCards: [DataCard] = []
    var arrCardFilter : [DataCard] = []
    var arrMonsters : [DataCard]?
    
    //MARK: - L I F E · C Y C L E
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCardTablelist()
        setUpSearchBar()
        setUpSearchBarProperties()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getAllCardsList()
    }
    
    //MARK: - W E B · S E R V I C E
    public func getAllCardsList() {
        self.view.activityStartAnimating(activityColor: .white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        let cardsWS = Cards_WS()
        cardsWS.getCardResponse(withHandler:{ [weak self]respuesta, error in
            guard let self = self else { return } //que estoy regresando aqui
            if error == nil {
                self.arrMonsters = self.getAndSplitCard(with: respuesta?.dataCard ?? [], andType: "Normal Monster")
                self.arrCards.removeAll()
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
    func setUpCardTablelist(){
        self.cardListTable.dataSource = self
        self.cardListTable.delegate = self
        self.cardListTable.register(CardListTableViewCell.nib, forCellReuseIdentifier: CardListTableViewCell.identifier)
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
    
    
    //MARK: - S E T · U P · K E Y B O A R D
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

