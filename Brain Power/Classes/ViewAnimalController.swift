//
//  ViewController.swift
//  Brain Power
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//

import UIKit

class ViewAnimalController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    static var answer = Set(["0"])
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    var arrayAnswer = [String]()
    let animalImage: [UIImage] = [
        
        UIImage(imageLiteralResourceName: "1") ,
        UIImage(imageLiteralResourceName: "2"),
        UIImage(imageLiteralResourceName: "3"),
        UIImage(imageLiteralResourceName: "4"),
        UIImage(imageLiteralResourceName: "5") ,
        UIImage(imageLiteralResourceName: "6"),
        UIImage(imageLiteralResourceName: "7"),
        UIImage(imageLiteralResourceName: "8"),
        UIImage(imageLiteralResourceName: "9") ,
        UIImage(imageLiteralResourceName: "10"),
        UIImage(imageLiteralResourceName: "11"),
        UIImage(imageLiteralResourceName: "12"),
        UIImage(imageLiteralResourceName: "13") ,
        UIImage(imageLiteralResourceName: "14"),
        UIImage(imageLiteralResourceName: "15"),
        UIImage(imageLiteralResourceName: "16"),
        UIImage(imageLiteralResourceName: "17"),
        UIImage(imageLiteralResourceName: "18"),
        UIImage(imageLiteralResourceName: "19"),
        UIImage(imageLiteralResourceName: "20"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if MediaTVC.colorBackground == 0{
            collectionView.backgroundColor = UIColor.white
        }
        else  {
            self.view.backgroundColor = UIColor.black
             collectionView.backgroundColor = UIColor.black
        }
       
        collectionView.dataSource = self
        collectionView.delegate  = self
        collectionView.scrollsToTop = true
        
        //  collectionView.isPagingEnabled = true
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.animalImage.image = animalImage[indexPath.item]
        
        
        
        
        
        
        
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        cell?.layer.borderWidth = 0.5
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        self.arrayAnswer.append(String(indexPath.item))
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth  = 2
        
        ViewAnimalController.answer = Set(arrayAnswer)
         
        
    }
    
}

