
import UIKit

//MARK: - EXTENSIONS
extension CardsListViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CardListTableViewCell.identifier, for: indexPath) as? CardListTableViewCell ?? CardListTableViewCell()
        
        cCell.setUpCardList(categoria: arrCards[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
        goToView.recibeCodable = arrCards[indexPath.row]
        goToView.stringBackground = "normal"
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}




//MARK: - UISEARCH RESULT

extension CardsListViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension CardsListViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == ""{
            getCardsList(withSearch: "") // busqueda con campo vacio, actualiza con letra borrada
            return true
        }else {
            getCardsList(withSearch: textField.text ?? "")
            return true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" && range.length == 1 && range.location == 0{
            getCardsList(withSearch: "")
            return true
        }
        getCardsList(withSearch: textField.text ?? "")
        return true
    }
}


