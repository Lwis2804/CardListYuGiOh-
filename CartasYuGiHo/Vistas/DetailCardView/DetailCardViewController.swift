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
    
    @IBOutlet weak var textView: UITextView!
    
    
    //MARK: - VARIABLES
    
    var downloadTask : URLSessionDownloadTask?
    var recibeCodable : Codable?
    var recibeUIcontroller : UIViewController?
    var stringBackground : String?
    
    
    //MARK: - LIFE · CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadTask?.cancel()
        downloadTask = nil
        self.setUp(withCard: recibeCodable as! DataCard, andBackGround: stringBackground ?? "")
    }
    
    //MARK: - FUNCTIONS
    
    
    func setUp(withCard card : DataCard, andBackGround strBackGrd : String) {
        self.view.layer.backgroundColor = UIColor(patternImage: UIImage(named: strBackGrd) ?? UIImage()).cgColor
        self.title = card.name
        self.nameCard.text = card.name
        self.typeCard.text = card.type
        self.archetypeCard.text = card.archetype
        self.textView.text = card.desc
       
         
        if let urlPoster = card.card_images,
           let url = URL(string: "\(urlPoster[0].image_url ?? "")"){
            downloadTask = cardImage.loadImage(url: url)
        }
    }

    
    //MARK: - NAVIGATION

    
    
    //MARK: - ACTIONS




}
