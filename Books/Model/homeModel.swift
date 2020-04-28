//
//  homeModel.swift
//  Books
//
//  Created by Muhammad Usman on 28/03/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import Foundation
import UIKit


struct categoryModel {
    var Image: UIImage?
    var name : String?
    
    init(Image: UIImage,name: String) {
        self.Image = Image
        self.name = name
    }
}



struct BookSummaryModel {
    var image: UIImage?
    var name: String?
    var KeyPoint: String?
    var TinySummary: String?
    var fullSummary:String?
    
    init(image: UIImage, name: String, keyPoint: String, TinySummary:String,fullSummary: String) {
        self.image = image
        self.name = name
        self.KeyPoint = keyPoint
        self.TinySummary = TinySummary
        self.fullSummary = fullSummary
    }
}

struct drawerModel {
    var image : UIImage?
    var name: String?
    
    init(image: UIImage, name: String) {
        self.name = name
        self.image = image
    }
}

