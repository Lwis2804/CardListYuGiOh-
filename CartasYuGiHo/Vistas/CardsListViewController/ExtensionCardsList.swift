
import UIKit

//MARK: - EXTENSIONS
extension CardsListViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMonster.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CardListTableViewCell.identifier, for: indexPath) as? CardListTableViewCell ?? CardListTableViewCell()
        
        cCell.setUpCardList(categoria: arrMonster[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
     //   goToView.recibeDatos = arr[indexPath.row]
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}



//MARK: - EXTENSIONS · RATE VIEW
extension CardsListViewController: RateCardViewDelegate {
    func closeRV() {
        
    }
    
    func rateCard(with value: String) {
        print("\n\n\n Me llego este valor de la vista --->  \(value) \n")
    }
    
}
