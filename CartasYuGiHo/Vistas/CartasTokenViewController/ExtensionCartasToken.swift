
import UIKit

//MARK: - UI · T A B L E · V I E W · D E L E G A T E S
extension CartasTokenViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? arrCardsFilter.count : arrMonsters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasTokenTableViewCell.identifier, for: indexPath) as? CartasTokenTableViewCell ?? CartasTokenTableViewCell()
        let arrSetUpCards = isFiltering ? arrCardsFilter : arrMonsters
        cCell.setUpCartasToken(categoria: arrSetUpCards?[indexPath.row] ?? DataCard())
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        let arrSetUpCards = isFiltering ? arrCardsFilter : arrMonsters
        goToView.recibeCodable = arrSetUpCards?[indexPath.row]
        goToView.stringBackground = "token"
        navigationController?.pushViewController(goToView, animated: true)
    }
}

//MARK: - U  I S E A R C H R E S U L T 

extension CartasTokenViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        buscarCartas(conCoincidencia: searchBar.text ?? "")
    }
    
    func buscarCartas(conCoincidencia: String) {
        guard let arrMonsters = arrMonsters else { return }
        arrCardsFilter = (arrMonsters.filter({ (carta : DataCard) -> Bool in
            return (carta.name?.lowercased().contains(conCoincidencia.lowercased()) ?? false)  
        }) )
        cardListTable.reloadData()
    }
}

