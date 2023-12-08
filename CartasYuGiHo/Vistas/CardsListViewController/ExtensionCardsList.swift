
import UIKit

//MARK: - UI · T A B L E · V I E W · D E L E G A T E S
extension CardsListViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? arrCardFilter.count : arrMonsters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CardListTableViewCell.identifier, for: indexPath) as? CardListTableViewCell ?? CardListTableViewCell()
        let arrSetUpCards = isFiltering ? arrCardFilter : arrMonsters // que esta pasando aqui
        cCell.setUpCardList(categoria: arrSetUpCards?[indexPath.row] ?? DataCard())
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        let arrSetUpCards = isFiltering ? arrCardFilter : arrMonsters
        goToView.recibeCodable = arrSetUpCards?[indexPath.row]
        goToView.stringBackground = "normal"
        navigationController?.pushViewController(goToView, animated: true)
    }
}
//MARK: - U I S E A R C H  R E S U L T

extension CardsListViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        buscarCartas(conCoincidencia: searchBar.text ?? "")
    }
    
    func buscarCartas(conCoincidencia: String) {
        guard let arrMonsters = arrMonsters else { return }
        arrCardFilter = (arrMonsters.filter({ (carta : DataCard) -> Bool in  // no me queda clara esta parte tampoco
            return (carta.name?.lowercased().contains(conCoincidencia.lowercased()) ?? false) // lowercased convierte a minusculas
        }) )
        cardListTable.reloadData()
    }
}




