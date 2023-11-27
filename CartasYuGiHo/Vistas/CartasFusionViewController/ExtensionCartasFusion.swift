
import UIKit

//MARK: - EXTENSIONS
extension CartasFusionViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasFusion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasFusionTableViewCell.identifier, for: indexPath) as? CartasFusionTableViewCell ?? CartasFusionTableViewCell()
        cCell.setUpCartasFusion(categoria: arrCartasFusion[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        goToView.recibeCodable = arrCartasFusion[indexPath.row]
        goToView.stringBackground = "fusion"
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}

//MARK: - UISEARCH RESULT

extension CartasFusionViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension CartasFusionViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
