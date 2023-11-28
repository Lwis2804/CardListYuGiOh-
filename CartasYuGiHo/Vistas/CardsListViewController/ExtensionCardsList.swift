
import UIKit

//MARK: - EXTENSIONS
extension CardsListViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return arrCardFilter.count
        }else{
            return arrMonsters?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CardListTableViewCell.identifier, for: indexPath) as? CardListTableViewCell ?? CardListTableViewCell()
        let arrSetUpCards = isFiltering ? arrCardFilter : arrMonsters
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




//MARK: - UISEARCH RESULT

extension CardsListViewController : UISearchResultsUpdating{
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        buscarCartas(conCoincidencia: searchBar.text ?? "")
    }
    
    func buscarCartas(conCoincidencia: String) {
        /*    for elemento in enLista {
         if elemento.name == conCoincidencia {
         return true
         }
         }
         return false
         }
         */
     //   guard let arrCards = arrCards else { return }
        arrCardFilter = (arrMonsters?.filter({ (carta : DataCard) -> Bool in
            print("Carta ---> \(arrCardFilter)")
            return (carta.name?.contains(conCoincidencia.lowercased()) ?? false)
        }) ?? [DataCard]())
        cardListTable.reloadData()
    }
    
}


extension CardsListViewController : UITextFieldDelegate {
/*
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.getCardsList(withSearch: textField.text ?? "")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        print("range.length \(range.length)")
        print("range.location\(range.location)")
        if string == "" && range.length == 1 && range.location >= 0{
        //    getCardsList(withSearch: "")
            buscarCartas(enLista: arrCards, conCoincidencia: textField.text ?? "")
            return true
        }
        buscarCartas(enLista: arrCards, conCoincidencia: textField.text ?? "")
      //  getCardsList(withSearch: textField.text ?? "")// otra funcion que busque elelemtno en un arreglo con un key == textfiel.text
        return true
    } */
}


