
import UIKit

//MARK: - EXTENSIONS
extension CartasRitualViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasRitual.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasRitualTableViewCell.identifier, for: indexPath) as? CartasRitualTableViewCell ?? CartasRitualTableViewCell()
        cCell.setUpCartasRitual(categoria: arrCartasRitual[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        goToView.recibeCodable = arrCartasRitual[indexPath.row]
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}

//MARK: - UISEARCH RESULT

extension CartasRitualViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension CartasRitualViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
