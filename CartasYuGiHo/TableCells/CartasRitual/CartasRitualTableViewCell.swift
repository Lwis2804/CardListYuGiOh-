//
//  CartasRitualTableViewCell.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 16/11/23.
//

import UIKit

class CartasRitualTableViewCell: UITableViewCell {

    
    //MARK: - OUTLETS
    @IBOutlet weak var backgroundImage: UIView!{
        didSet{self.backgroundImage.layer.cornerRadius = 10}
    }
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    
    //MARK: - VARIABLES
    
    var downloadTask : URLSessionDownloadTask?
    
    
    //MARK: - LIFE · CYCLE

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        downloadTask?.cancel()
        downloadTask = nil
    }

    //MARK: - FUNCTIONS

    public func setUpCartasRitual (categoria : DataCard) {
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
