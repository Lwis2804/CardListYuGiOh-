
import UIKit

//MARK: - UI · T A B L E · V I E W · D E L E G A T E S
extension CartasRitualViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? arrCardFilter.count : arrMonsters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasRitualTableViewCell.identifier, for: indexPath) as? CartasRitualTableViewCell ?? CartasRitualTableViewCell()
        let arrSetUpCards = isFiltering ? arrCardFilter : arrMonsters
        cCell.setUpCartasRitual(categoria: arrSetUpCards?[indexPath.row] ?? DataCard())
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        let arrSetUpCards = isFiltering ? arrCardFilter : arrMonsters
        goToView.recibeCodable = arrSetUpCards?[indexPath.row]
        goToView.stringBackground = "ritual"
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}

//MARK: - UI S E A R C H R E S U L T

extension CartasRitualViewController : UISearchResultsUpdating{
    
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



