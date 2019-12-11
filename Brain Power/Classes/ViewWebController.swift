//
//  ViewWebController.swift
//  Brain Power
//
//  Created by Rebero Prince on 12/4/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//

import UIKit

class ViewWebController: UIViewController {
    
    @IBOutlet var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string:  "https://masterofmemory.com/remembering-images/")
        
        
        myWebView.loadRequest(URLRequest(url: url!))
        // Do any additional setup after loading the view.
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
