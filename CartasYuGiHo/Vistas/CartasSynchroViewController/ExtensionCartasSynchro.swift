import UIKit

//MARK: - UI · T A B L E · V I E W · D E L E G A T E S
extension CartasSynchroViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? arrCardFilter.count : arrMonsters?.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasSynchroTableViewCell.identifier, for: indexPath) as? CartasSynchroTableViewCell ?? CartasSynchroTableViewCell()
        let arrSetUpCard = isFiltering ? arrCardFilter : arrMonsters
        cCell.setUpCartasSynchro(categoria: arrSetUpCard?[indexPath.row] ?? DataCard())
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        let arrSetUpCard = isFiltering ? arrCardFilter : arrMonsters
        goToView.recibeCodable = arrSetUpCard?[indexPath.row]
        navigationController?.pushViewController(goToView, animated: true)
    }
}


//MARK: - UISEARCH RESULT

extension CartasSynchroViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        buscarCartas(conCoincidencia: searchBar.text ?? "")
    }
    
    func buscarCartas(conCoincidencia: String) {
        guard let arrMonsters = arrMonsters else { return }
        arrCardFilter = (arrMonsters.filter({ (carta : DataCard) -> Bool in
            return (carta.name?.lowercased().contains(conCoincidencia.lowercased()) ?? false)
        }) )
        cardListTable.reloadData()
    }
}
