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
    @IBOutlet weak var nameCard: UILabel!{
        didSet{self.nameCard.layer.cornerRadius = 20}
    }
    @IBOutlet weak var typeCard: UILabel!{
        didSet{self.typeCard.layer.cornerRadius = 20}
    }
    @IBOutlet weak var archetypeCard: UILabel!{
        didSet{self.archetypeCard.layer.cornerRadius = 20}
    }
    @IBOutlet weak var descriptionCard: UILabel!{
        didSet{self.descriptionCard.layer.cornerRadius = 20}
    }
    
    
    
    //MARK: - VARIABLES
    
    var downloadTask : URLSessionDownloadTask?
    var recibeCodable : Codable?
    var recibeUIcontroller : UIViewController?

    
    
    //MARK: - LIFE · CYCLE
    override func viewDidLoad() {
        downloadTask?.cancel()
        downloadTask = nil
        super.viewDidLoad()
        
        switch recibeCodable {
        case is DataCard:
             setUpCartasMounstroinf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasMounstroEfectoinf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasMagicasInf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasTrampaInf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasFusionInf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasXYZInf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasPenduloInf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasSynchroInf(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasLink(categoria: recibeCodable as! DataCard)
        case is DataCard:
             setUpCartasToken(categoria: recibeCodable as! DataCard)
         default:
             break
         }
    }
    
    //MARK: - FUNCTIONS
    
   func setUpCartasMounstroinf(categoria : DataCard){
       self.view.layer.backgroundColor = UIColor(patternImage: UIImage(named: "normal") ?? UIImage()).cgColor
       self.title = categoria.name
       self.nameCard.text = categoria.name
       self.typeCard.text = categoria.type
       self.archetypeCard.text = categoria.archetype
       self.descriptionCard.text = categoria.desc
      
        
       if let urlPoster = categoria.card_images,
          let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
           downloadTask = cardImage.loadImage(url: url)
       }
        }
    
    func setUpCartasMounstroEfectoinf(categoria : DataCard){
        self.view.layer.backgroundColor = UIColor(patternImage: UIImage(named: "effect") ?? UIImage()).cgColor
        self.title = categoria.name
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
        self.view.layer.backgroundColor = UIColor(patternImage: UIImage(named: "spell") ?? UIImage()).cgColor
        self.title = categoria.name
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
        self.view.layer.backgroundColor = UIColor(patternImage: UIImage(named: "trap") ?? UIImage()).cgColor
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    
    func setUpCartasFusionInf(categoria : DataCard){
        self.view.layer.backgroundColor = UIColor(patternImage: UIImage(named: "fusion") ?? UIImage()).cgColor
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    
    func setUpCartasRitualInf(categoria : DataCard){
        self.view.layer.backgroundColor = UIColor(patternImage: UIImage(named: "ritual") ?? UIImage()).cgColor
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    
    func setUpCartasXYZInf(categoria : DataCard){
        self.view.layer.backgroundColor = UIColor(patternImage: UIImage(named: "xyz") ?? UIImage()).cgColor
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    
    func setUpCartasPenduloInf(categoria : DataCard){
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    
    func setUpCartasSynchroInf(categoria : DataCard){
        
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    
    func setUpCartasLink(categoria : DataCard){
        
        self.nameCard.text = categoria.name
        self.typeCard.text = categoria.type
        self.archetypeCard.text = categoria.archetype
        self.descriptionCard.text = categoria.desc
       
         
        if let urlPoster = categoria.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
         }
    
    func setUpCartasToken(categoria : DataCard){
        
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
