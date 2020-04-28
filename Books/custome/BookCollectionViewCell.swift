//
//  BookCollectionViewCell.swift
//  Books
//
//  Created by Muhammad Usman on 29/03/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
       @IBOutlet weak var itemImg: UIImageView!
       @IBOutlet weak var nameLbl: UILabel!
       @IBOutlet weak var descriptionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
