//
//  ViewController.swift
//  Brain Power
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    let animalName = ["1","2","3","4","1","2","3","4","1","2","3","4","1","2","3","4"]
    
    var arrayAnswer = [String]()
    let animalImage: [UIImage] = [
        
        UIImage(imageLiteralResourceName: "1") ,
        UIImage(imageLiteralResourceName: "2"),
        UIImage(imageLiteralResourceName: "3"),
        UIImage(imageLiteralResourceName: "4"),
        UIImage(imageLiteralResourceName: "1") ,
        UIImage(imageLiteralResourceName: "2"),
        UIImage(imageLiteralResourceName: "3"),
        UIImage(imageLiteralResourceName: "4"),
        UIImage(imageLiteralResourceName: "1") ,
        UIImage(imageLiteralResourceName: "2"),
        UIImage(imageLiteralResourceName: "3"),
        UIImage(imageLiteralResourceName: "4"),
        UIImage(imageLiteralResourceName: "1") ,
        UIImage(imageLiteralResourceName: "2"),
        UIImage(imageLiteralResourceName: "3"),
        UIImage(imageLiteralResourceName: "4")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate  = self
        collectionView.scrollsToTop = true
        
        //  collectionView.isPagingEnabled = true
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        
        cell.imageView.image = animalImage[indexPath.item]
        
       
        
        
        
        
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
        print(arrayAnswer)
    }
    
}

