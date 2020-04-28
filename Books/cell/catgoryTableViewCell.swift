//
//  catgoryTableViewCell.swift
//  Books
//
//  Created by Muhammad Usman on 01/04/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class catgoryTableViewCell: UITableViewCell {

    @IBOutlet weak var catgoryLabel: UILabel!
    @IBOutlet weak var catgoryImagy: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
