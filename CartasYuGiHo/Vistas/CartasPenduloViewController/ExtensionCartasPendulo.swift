import UIKit

//MARK: - EXTENSIONS
extension CartasPenduloViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasPendulo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasPenduloTableViewCell.identifier, for: indexPath) as? CartasPenduloTableViewCell ?? CartasPenduloTableViewCell()
        cCell.setUpCartasPendulo(categoria: arrCartasPendulo[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        goToView.recibeCodable = arrCartasPendulo[indexPath.row]
        goToView.stringBackground = ""
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}


//MARK: - UISEARCH RESULT

extension CartasPenduloViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension CartasPenduloViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
