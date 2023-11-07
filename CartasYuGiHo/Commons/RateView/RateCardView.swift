//  RateCardView.swift
//  CartasYuGiHo
//  Created by Moises Abraham Vazquez Perez on 06/11/23.

import UIKit

//MARK: - P R O T O C O L O · DEL RATE CARD VIEW
protocol RateCardViewDelegate: AnyObject {
    func closeRV()
    func rateCard(with value: String)
}

class RateCardView: UIView {
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var txfValue: UITextField!
    @IBOutlet weak var btnRate: UIButton!
    
    static var rateIdentifier: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: rateIdentifier, bundle: .main)}
    
    
    //MARK: - V A R I A B L E · D E L E G A T E · P A R A · PODER · IMPLEMENTAR
    weak var rateDelegate: RateCardViewDelegate?
    
    
    
    override func awakeFromNib() { }
    
    
    
    //MARK: - A C T I O N S
    @IBAction func closeView(_ sender: Any) {
        rateDelegate?.closeRV()
        // UNA FUNCION GENERICA QUE HACE REFENCIA A EL CIERRE DE LA VISTA, QUIEN LO IMPLEMENTE, TIENE QUE HACER ESA FUNCION
    }

    @IBAction func rateCard(_ sender: Any) {
        rateDelegate?.rateCard(with: txfValue.text ?? "0.0")
    }
    
    
    
    //MARK: - VIEW · IMPLEMENTADA DE MANERA RAPIDA
    public class func instantiateView() -> RateCardView {
        if let nib = Bundle.main.loadNibNamed(RateCardView.rateIdentifier, owner: self, options: nil)?[0] as? RateCardView {
            return nib
        }
        return RateCardView()
    }
}
