//
//  DetailVC.swift
 // Brain Power
// 
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//
//

import UIKit

class DetailVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

 
    @IBOutlet var labelTime: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    var timerTest : Timer?
    
    
    var diffulity = 0
    
    var increment = 0
    var incrementMax  =  0
    var timer = 3
    var timerMax = 0
    var numbers: [Int] = []
    static var chosen: [Int] = []
    var starsArray: [UIImageView]!
    var item: Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          var played = UserDefaults.standard.integer(forKey: "played")
        
         played += 1
        
        UserDefaults.standard.set(played, forKey: "played")
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(doSomething), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(doSomethings), name: UIApplication.willResignActiveNotification, object: nil)

        
        if MediaTVC.colorBackground == 0{
            self.view.backgroundColor = UIColor.white
        }
        else{
            self.view.backgroundColor = UIColor.black
        }
         self.labelTime.text = "Be Ready, Game about to start!!!"
        
        self.title = item?.title
        
        diffulity = MediaTVC.hardness
        
        
        if diffulity == 0 {
            
            timerMax = 5
            incrementMax = 5
            
            
        } else if diffulity == 1 {
            timerMax = 3
            incrementMax = 6
        }else{
            timerMax = 2
            incrementMax = 7
        }
        print(diffulity,":",timerMax)
        
        timer = timerMax
         startTimer()
        titleImageView?.image = UIImage(data: item!.image! as Data)
        
    }
    
    
    func startTimer () {
        guard timerTest == nil else { return }
        
        timerTest =   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    
    
    func stopTimerTest() {
        timerTest?.invalidate()
        
    }
    
    
    
    @objc private func doSomething() {
        if ( self.incrementMax != self.increment){
            let alert = UIAlertController(title:"Brain Power", message: "You about to Resume", preferredStyle: UIAlertController.Style.alert )
            
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {
                _ in
                
                self.timerTest =   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
            }))
            present(alert, animated: true, completion: nil)
        }
        
        
        
     
        
    }
    
    @objc private func doSomethings() {
        
        self.timerTest?.invalidate()
     }
    
    @objc func updateTime(){
         timer -= 1
        var animationTime = 0.0
        
        if diffulity == 0{
            animationTime = 1.2
            
        }
            
       else if diffulity == 1{
            animationTime = 0.9
        }
        else{
            animationTime = 0.8
        }
        
        if  (timer == 0){
            labelTime.text = "Time Out!!"
        }
        
        
        
        
        
        if( timer == 1){
            let number = Int.random(in: 1..<105)
            
            var animation1 =  UIView.AnimationOptions.curveEaseIn
           
           
            
            if number % 3 == 0{
                  animation1 = UIView.AnimationOptions.transitionCurlUp
            }
            else if number % 3 == 1{
                 animation1 = UIView.AnimationOptions.curveEaseOut
            }
            else{
                animation1 = UIView.AnimationOptions.transitionFlipFromLeft
            }
            
            
            
            UIView.animate(withDuration: animationTime, delay: 0.5,
                           options: animation1,
                           animations: {
                            if number % 2 == 0{
                                self.titleImageView.alpha = 0

                            }
            },   completion: {
                
                (Bool) -> Void in
               
                
                let name = self.randomSequenceGenerator(min: 1, max: 20)
                let numbers = name()
                DetailVC.chosen.append(numbers)
                
                
                self.increment += 1
                
                 self.titleImageView.image = UIImage(imageLiteralResourceName: String(numbers))
 
                self.titleImageView.alpha = 1
                
                self.timer  = self.timerMax
                if self.increment == self.incrementMax{
                     self.labelTime.text = "Go to test your memory!!!"
                    self.titleImageView.image = UIImage(imageLiteralResourceName: "im")
                    self.stopTimerTest()
                }
                 
                
            })
        }
        
        
        if (increment != 0  && timer != 0){
             labelTime.text = String(timer)
        }
       
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
         DetailVC.chosen = []
        
      
    }
    
    func randomSequenceGenerator(min: Int, max: Int) -> () -> Int {
        
        return {
            if self.numbers.isEmpty {
                self.numbers = Array(min ... max)
            }
            
            let index = Int(arc4random_uniform(UInt32(self.numbers.count)))
            return self.numbers.remove(at: index)
        }
    }

    func updateRating(rating: Int) {
        guard rating <= starsArray.count else { return }
        for (_, star) in starsArray.enumerated() {
            star.isHidden = true
        }
    }

    
    
    
    
    
    @IBAction func backgroundChange(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Change background", message: "Select to change background color.", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Yellow", style: .default, handler: {
            action in
            self.view.backgroundColor = UIColor.yellow
        }))
        actionSheet.addAction(UIAlertAction(title: "White", style: .default, handler: {
            action in
            self.view.backgroundColor = UIColor.white
        }))
        actionSheet.addAction(UIAlertAction(title: "Grey", style: .default, handler: {
            action in
            self.view.backgroundColor = UIColor.gray
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {
            action in
        }))
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.sourceRect = (sender as AnyObject).frame
        present(actionSheet, animated: true, completion: nil)
        
        
    }
}
