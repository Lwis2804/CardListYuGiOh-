
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
     //   goToView.recibeDatos = arr[indexPath.row]
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}
