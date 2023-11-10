import UIKit

//MARK: - EXTENSIONS
extension CartasSynchroViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasSynchro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasSynchroTableViewCell.identifier, for: indexPath) as? CartasSynchroTableViewCell ?? CartasSynchroTableViewCell()
        cCell.setUpCartasSynchro(categoria: arrCartasSynchro[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        goToView.recibeCodable = arrCartasSynchro[indexPath.row]
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}


//MARK: - UISEARCH RESULT

extension CartasSynchroViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension CartasSynchroViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
