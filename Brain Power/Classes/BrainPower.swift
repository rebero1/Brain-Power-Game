//
//  
//  Project 3
//
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//
//

import UIKit

class MediaTVCell: UITableViewCell {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var star_01: UIImageView!
    @IBOutlet weak var star_02: UIImageView!
    @IBOutlet weak var star_03: UIImageView!
    @IBOutlet weak var star_04: UIImageView!
    @IBOutlet weak var star_05: UIImageView!
    
    @IBOutlet weak var zodiac: UILabel!
    var starsArray: [UIImageView]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        starsArray = [star_01, star_02, star_03, star_04, star_05]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateRating(rating: Int) {
        guard rating <= starsArray.count else { return }
        for (_, star) in starsArray.enumerated() {
            star.isHidden = true
        }
    }
     
}
