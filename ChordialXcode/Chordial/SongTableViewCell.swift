//
//  SongTableViewCell.swift
//  Chordial
//
//  Created by Ziv Kaputa on 10/23/16.
//  Copyright © 2016 Ziv Kaputa. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
   

    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
