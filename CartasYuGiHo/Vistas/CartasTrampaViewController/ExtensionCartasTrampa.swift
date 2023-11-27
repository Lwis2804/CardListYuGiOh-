
import UIKit

//MARK: - EXTENSIONS
extension CartasTrampaViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasTrampa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasTrampaTableViewCell.identifier, for: indexPath) as? CartasTrampaTableViewCell ?? CartasTrampaTableViewCell()
        cCell.setUpCartasTrampa(categoria: arrCartasTrampa[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        goToView.recibeCodable = arrCartasTrampa[indexPath.row]
        goToView.stringBackground = "trap"
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}


//MARK: - UISEARCH RESULT

extension CartasTrampaViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension CartasTrampaViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
