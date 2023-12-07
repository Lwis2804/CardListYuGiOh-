
import UIKit

//MARK: - UI · T A B L E · V I E W · D E L E G A T E S
extension CartasFusionViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? arrCardFilter.count : arrMonster?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasFusionTableViewCell.identifier, for: indexPath) as? CartasFusionTableViewCell ?? CartasFusionTableViewCell()
        let arrsetUpCards = isFiltering ? arrCardFilter : arrMonster
        cCell.setUpCartasFusion(categoria: arrsetUpCards?[indexPath.row] ?? DataCard())
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        let arrSetUpCards = isFiltering ? arrCardFilter : arrMonster
        goToView.recibeCodable = arrSetUpCards?[indexPath.row]
        goToView.stringBackground = "fusion"
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}

//MARK: - U I S E A R C H  R E S U L T

extension CartasFusionViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        buscarCartas(conCoincidencia: searchBar.text ?? "")
    }
    func buscarCartas(conCoincidencia: String) {
        guard let arrMonsters = arrMonster else { return }
        arrCardFilter = (arrMonsters.filter({ (carta : DataCard) -> Bool in
            return (carta.name?.lowercased().contains(conCoincidencia.lowercased()) ?? false) // lowercased convierte a minusculas
        }) )
        cardListTable.reloadData()
    }
}

