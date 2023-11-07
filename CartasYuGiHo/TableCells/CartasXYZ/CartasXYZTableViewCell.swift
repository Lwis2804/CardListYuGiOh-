//
//  CartasXYZTableViewCell.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 06/11/23.
//

import UIKit

class CartasXYZTableViewCell: UITableViewCell {

    
    //MARK: - OUTLETS
    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    
    //MARK: - VARIABLES
    
    var downloadTask : URLSessionDownloadTask?
    var prueba = ""
    
    
    //MARK: - LIFE · CYCLE

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        downloadTask?.cancel()
        downloadTask = nil
    }

    //MARK: - FUNCTIONS

    public func setUpCartasXYZ (categoria : DataCard) {
        self.cardName.text = categoria.name
       
        
        
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url_small ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
}
