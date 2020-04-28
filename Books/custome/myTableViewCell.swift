//
//  myTableViewCell.swift
//  Books
//
//  Created by Muhammad Usman on 01/04/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {
    @IBOutlet weak var myImagetable: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var descripLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
