//
//  BathroomModel.swift
//  PoopScoop
//
//  Created by jeff hsu on 8/3/18.
//  Copyright © 2018 Jeffrey Hsu. All rights reserved.
//

import UIKit

class BathroomModel: NSObject {
    var name: String?
    var address: String?
    var distance: Int?
    var timeToGetThere: Int?
    var rating = 0
    var previewImage: UIImage?
    
    init(name: String, address: String, distance: Int, time: Int, rating: Int, previewImage: UIImage) {
        self.name = name
        self.address = address
        self.distance = distance
        self.timeToGetThere = time
        self.rating = rating
        self.previewImage = previewImage
    }
}
