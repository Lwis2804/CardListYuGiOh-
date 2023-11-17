
import UIKit

//MARK: - EXTENSIONS
extension CartasMounstroEfectoViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasMounstroEfecto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasMounstroEfectoTableViewCell.identifier, for: indexPath) as? CartasMounstroEfectoTableViewCell ?? CartasMounstroEfectoTableViewCell()
        cCell.setUpCartasMounstroEfecto(categoria: arrCartasMounstroEfecto[indexPath.row])
        return cCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        goToView.recibeCodable = arrCartasMounstroEfecto[indexPath.row]
        goToView.stringBackground = "effect"
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}

//MARK: - UISEARCH RESULT

extension CartasMounstroEfectoViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension CartasMounstroEfectoViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
