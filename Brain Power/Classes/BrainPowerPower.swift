//
//  TableViewController.swift
 
////
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//

import UIKit
import CoreData

class MediaTVC: UITableViewController, EditItemDelegate {
 
    
    let color = ["White","Black"]
    static var colorBackground = 0
    static var hardness = 0
    static var name = ""
    var hard = [Int]()
     var colors = [String]()
    let difficulity = ["Easy","Medium","Hard"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
          MediaTVC.colorBackground = 0
        CoreDataStack.shared.update()
        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let message = "Welcome in Brain Power.\nYou will start by creating a profile.\nYour profile will have name, age, background color, and type of diffucility.\n For difficulity type easy, you will have 5 seconds to memorize 1 picture, and you will see 5 pictures.\nFor difficulity type medium, you will have 3 seconds to memorize 1 picture, and you will see 6 pictures.\nFor difficulitity type hard, you will have 2 seconds to memorize 1 picture, and you will see 7 pictures.\nYou can change the background according to your set profile.\nGood Luck"
        
        
          var start = UserDefaults.standard.integer(forKey: "displayed")
        
        
        
        
        if (start == 0){
            let alert = UIAlertController(title:"Brain Power", message: message, preferredStyle: UIAlertController.Style.alert )
            
            alert.addAction(UIAlertAction(title: "Let's go!", style: UIAlertAction.Style.default, handler: {
                _ in
                UserDefaults.standard.set(1, forKey: "displayed")
            }))
            present(alert, animated: true, completion: nil)
        }
        start  = start + 1
    }
    
    
    
    
    @IBAction func score(_ sender: Any) {
        
        
        let g = UserDefaults.standard.integer(forKey: "Score")
        var message = ""
        let played = UserDefaults.standard.integer(forKey: "played")

        if (g == 0){
            message = "NO HIGHEST SCORE"
        }else{
            message = "The highest score is: " + String(g) + "\nYou played " + String(played) + "  times"
        }
        let alert = UIAlertController(title:"Brain Power", message: message, preferredStyle: UIAlertController.Style.alert )
        
        alert.addAction(UIAlertAction(title: "DONE", style: UIAlertAction.Style.default, handler: {
            _ in
        }))
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "EditItemSegue":
            if let vc = segue.destination as? EditItemVC {
                vc.delegate = self
            }
        case "DetailViewSegue":
            if let vc = segue.destination as? DetailVC {
                if let indexPath = tableView.indexPathForSelectedRow {
              
                    vc.item = CoreDataStack.shared.items[indexPath.row] as? Item
                    if(vc.item?.type == Int16(0) ){
                         MediaTVC.hardness = 0
                    }
                    else if (vc.item?.type == Int16(1)){
                        MediaTVC.hardness = 1
                    } else{
                         MediaTVC.hardness = 2
                    }
                    
                    
                    MediaTVC.name = vc.item!.title ?? "User"
                     print(MediaTVC.name)
                    
                    
                    MediaTVC.colorBackground = (vc.item?.published?.contains("Bl"))! ?  1:0
                    
                 
                }
            }
        default:
            fatalError("Invalid segue identifier")
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataStack.shared.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MediaTVCell") as? MediaTVCell else {
            fatalError("Expected MediaTVCell")
        }
        if let item = CoreDataStack.shared.items[indexPath.row] as? Item {
            
            
            
            hard.append(Int(item.type))
            colors.append(item.published ?? "white")
            
            
           cell.titleLabel?.text = item.title
            cell.artistLabel?.text = "Type of the game: " + difficulity[Int(item.type)]
            cell.zodiac?.text = "Background will be: " + item.published!
            cell.titleImageView?.image = #imageLiteral(resourceName: "im")
            cell.updateRating(rating: Int(item.rating))
        }
    
        return cell
    }
    
    #if !DEBUG
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return tableView.isEditing ? .delete : .none
    }
    #endif
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let item = CoreDataStack.shared.items[indexPath.row] as? Item {
                deletionAlert(title: item.title!) { _ in
                    CoreDataStack.shared.deleteItem(item: item)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        
        let alertMsg = "Are you sure you want to delete \(title)? This cannot be undone! ALERT NO.2"
        let alert = UIAlertController(title: "Warning", message: alertMsg, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }

    func addedMediaItem() {
        tableView.reloadData()
    }
    
    @IBAction func onToggleEditing(_ sender: UIBarButtonItem) {
        setEditing(!isEditing, animated: true)
    }

}
