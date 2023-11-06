
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
     //   goToView.recibeDatos = arr[indexPath.row]
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}
