
import UIKit

//MARK: - EXTENSIONS
extension CartasXYZViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasXYZ.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasXYZTableViewCell.identifier, for: indexPath) as? CartasXYZTableViewCell ?? CartasXYZTableViewCell()
        cCell.setUpCartasXYZ(categoria: arrCartasXYZ[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
     //   goToView.recibeDatos = arr[indexPath.row]
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}
