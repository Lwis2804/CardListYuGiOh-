
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = self.createNavController(for: CardsListViewController(), title: "Mounstro", image: UIImage(systemName: "Yu-Gi-Oh!_(Logo)") ?? UIImage())
        let view2 = self.createNavController(for: CartasMounstroEfectoViewController(), title: "M Efecto", image: UIImage(systemName: "Yu-Gi-Oh!_(Logo)") ?? UIImage())
        let view3 = self.createNavController(for: CartasMgicasViewController(), title: "Magicas", image: UIImage(systemName: "Yu-Gi-Oh!_(Logo)") ?? UIImage())
        let view4 = self.createNavController(for: CartasTrampaViewController(), title: "Trampa", image: UIImage(systemName: "Yu-Gi-Oh!_(Logo)") ?? UIImage())
        let view5 = self.createNavController(for: CartasFusionViewController(), title: "Fusion", image: UIImage(systemName: "Yu-Gi-Oh!_(Logo)") ?? UIImage())
        let view6 = self.createNavController(for: CartasXYZViewController(), title: "XYZ", image: UIImage(systemName: "Yu-Gi-Oh!_(Logo)") ?? UIImage())
        let view7 = self.createNavController(for: CartasSynchroViewController(), title: "Synchro", image: UIImage(systemName: "Yu-Gi-Oh!_(Logo)") ?? UIImage())
        let view8 = self.createNavController(for: CartasPenduloViewController(), title: "Pendulo", image: UIImage(systemName: "Yu-Gi-Oh!_(Logo)") ?? UIImage())
        
        self.viewControllers = [ view1, view2, view3, view4, view5, view6, view7, view8]
    }

    func createNavController(for mainViewController: UIViewController, title: String, image : UIImage ) -> UIViewController {
        let navController = UINavigationController(rootViewController: mainViewController)
        navController.tabBarItem.title = "\(title)"
        mainViewController.navigationItem.title = "\(title)"
        navController.tabBarItem.image = image
        mainViewController.navigationItem.backButtonTitle = "Atras"
        return navController
    }
}

