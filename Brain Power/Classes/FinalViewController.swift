//
//  FinalViewController.swift
//  Brain Power
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//

import UIKit
import Foundation

class FinalViewController: UIViewController {

 
    @IBOutlet var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        view.addGestureRecognizer(tap)
        if MediaTVC.colorBackground == 0{
            self.view.backgroundColor = UIColor.white
        }
        else{
            self.view.backgroundColor = UIColor.black
        }
        print(ViewAnimalController.answer)
        print(DetailVC.chosen)
        var correct = 0
        
        for item in ViewAnimalController.answer{
            if( DetailVC.chosen.contains(Int(item)!+1)){
                
                correct += 1
            }
        }
        
        labelResult.text = "Score: "+String(correct)+"/ "+String(DetailVC.chosen.count)+""
        
        print("Chosen : " )
        print(DetailVC.chosen)
        
        let g = UserDefaults.standard.integer(forKey: "Score")
        
        
        if( correct > g){
            let defaults =  UserDefaults.standard
             defaults.set(correct, forKey: "Score")
            
           
        }
        

        // Do any additional setup after loading the view.
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
         guard sender.view != nil else {return}
        if sender.state == .ended {
            UIView.animate(withDuration: 1.0, animations: {
                self.labelResult.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
               
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIView {
    func move(to destination: CGPoint, duration: TimeInterval,
              options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.center = destination
        }, completion: nil)
    }
}
