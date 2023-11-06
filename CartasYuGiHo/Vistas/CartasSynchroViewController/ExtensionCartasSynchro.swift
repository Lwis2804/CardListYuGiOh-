import UIKit

//MARK: - EXTENSIONS
extension CartasSynchroViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartasSynchro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cCell = tableView.dequeueReusableCell(withIdentifier: CartasSynchroTableViewCell.identifier, for: indexPath) as? CartasSynchroTableViewCell ?? CartasSynchroTableViewCell()
        cCell.setUpCartasSynchro(categoria: arrCartasSynchro[indexPath.row])
        return cCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToView = DetailCardViewController()
     //   goToView.recibeDatos = arr[indexPath.row]
        navigationController?.pushViewController(goToView, animated: true)
    }
    
    
 
}
