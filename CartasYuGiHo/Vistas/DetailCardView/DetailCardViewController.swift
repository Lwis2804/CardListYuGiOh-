//
//  DetailCardViewController.swift
//  CartasYuGiHo
//
//  Created by LUIS GONZALEZ on 30/10/23.
//

import UIKit

class DetailCardViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var nameCard: UILabel!
    @IBOutlet weak var typeCard: UILabel!
    @IBOutlet weak var archetypeCard: UILabel!
    @IBOutlet weak var descriptionCard: UILabel!
    
    
    
    //MARK: - VARIABLES
    
    var downloadTask : URLSessionDownloadTask?
    var recibeCodable : Codable?
    
    
    //MARK: - LIFE · CYCLE
    override func viewDidLoad() {
        downloadTask?.cancel()
        downloadTask = nil
        super.viewDidLoad()
        
        switch recibeCodable {
        case is DataCard:
             setUpCartasMounstroinf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasMagicasInf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasTrampaInf(categoria: recibeCodable as! DataCard)
         default:
             break
         }
    }
    
    //MARK: - FUNCTIONS
    
   func setUpCartasMounstroinf(categoria : DataCard){
       self.nameCard.text = categoria.name
       self.typeCard.text = categoria.type
       self.archetypeCard.text = categoria.archetype
       self.descriptionCard.text = categoria.desc
      
        
       if let urlPoster = categoria.card_images,
          let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
           downloadTask = cardImage.loadImage(url: url)
       }
        }
    
    func setUpCartasMagicasInf(categoria : DataCard){
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    
    func setUpCartasTrampaInf(categoria : DataCard){
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    //MARK: - NAVIGATION

    
    
    //MARK: - ACTIONS




}
