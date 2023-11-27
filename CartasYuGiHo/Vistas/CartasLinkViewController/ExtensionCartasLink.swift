
import UIKit

//MARK: - EXTENSIONS
extension CartasLinkViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasLink.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasLinkTableViewCell.identifier, for: indexPath) as? CartasLinkTableViewCell ?? CartasLinkTableViewCell()
        cCell.setUpCartasLink(categoria: arrCartasLink[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        goToView.recibeCodable = arrCartasLink[indexPath.row]
        goToView.stringBackground = "link"
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}

//MARK: - UISEARCH RESULT

extension CartasLinkViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension CartasLinkViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
