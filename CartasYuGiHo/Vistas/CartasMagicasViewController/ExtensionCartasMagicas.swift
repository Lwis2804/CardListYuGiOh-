
import UIKit

//MARK: - UI · T A B L E · V I E W · D E L E G A T E S
extension CartasMgicasViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? arrCardFilter.count : arrMonster?.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasMagicasTableViewCell.identifier, for: indexPath) as? CartasMagicasTableViewCell ?? CartasMagicasTableViewCell()
        let arrSetUpCard = isFiltering ? arrCardFilter : arrMonster
        cCell.setUpCartasMagicas(categoria: arrSetUpCard?[indexPath.row] ?? DataCard())
        return cCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        let arrSetUpCard = isFiltering ? arrCardFilter : arrMonster
        goToView.recibeCodable = arrSetUpCard?[indexPath.row]
        goToView.stringBackground = "spell"
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}

//MARK: - U I S E A R C H  R E S U L T

extension CartasMgicasViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        buscarCartas(conCoincidencia: searchBar.text ?? "")
    }
    
    func buscarCartas(conCoincidencia: String) {
        guard let arrMonster = arrMonster else { return }
        arrCardFilter = (arrMonster.filter({ (carta : DataCard) -> Bool in return
            (carta.name?.lowercased().contains(conCoincidencia.lowercased()) ?? false)
        }) )
        cardListTable.reloadData()
    }
}

