//
//  ViewController.swift
//  AH_Logo_Quiz
//
//  Created by Abhijit Hadkar on 20/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logosCollectionView: UICollectionView!
    @IBOutlet weak var wordGuessCollectionView: UICollectionView!
    @IBOutlet weak var randomLettersCollectionView: UICollectionView!
    var logosArray:[Logo]?
    let sectionInsets = UIEdgeInsets(top: 16.0, left: 8.0, bottom: 0.0, right: 4.0)
    let itemsPerRow: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupCollectionViewDelegateDataSource()
    }

}

// MARK:- Setup/Load Controller extension
extension ViewController{
    
    func setupController(){
        self.title = "Logo Quiz"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Load Logos from file
        self.loadLogos()
    }
    
    // Load logos
    func loadLogos() {
        if let path = Bundle.main.path(forResource: "logo", ofType: "txt") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSONDecoder().decode([Logo].self,from:data)                
                self.logosArray = jsonObj
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        }
    }
}

struct Logo : Codable{
    var name: String
    var imgUrl: String
//    var nameCount: Int
    
    init(name:String,imgUrl:String) {
        self.name = name
        self.imgUrl = imgUrl
//        self.nameCount = nameCount
    }
}
