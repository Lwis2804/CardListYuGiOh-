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
   //     downloadTask?.cancel()
   //     downloadTask = nil
        super.viewDidLoad()
    }
    
    //MARK: - FUNCTIONS
    
/*    func setUpPlayingNowInf(categoria : NowPlayingResult){
        self.lblDateDetail.text = categoria.release_date
        self.lblMovieTitle.text = categoria.title
        self.lblGeneroDetail.text = "\(String(describing: categoria.genre_ids))"
        self.lblDexcriptionMovieDetail.text = categoria.overview
        self.lblDuracionDetail.text = categoria.original_language
        
        if let urlPoster = categoria.backdrop_path,
           let url = URL(string: "https://image.tmdb.org/t/p/w500\(urlPoster)"){
            downloadTask = imgMovieDetail.loadImage(url: url)
        }
    */
    
    //MARK: - NAVIGATION

    
    
    //MARK: - ACTIONS




}
