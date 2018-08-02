//
//  CustomMarkView.swift
//  PoopScoop
//
//  Created by jeff hsu on 7/29/18.
//  Copyright © 2018 Jeffrey Hsu. All rights reserved.
//

import UIKit

class CustomMarkerView: UIView {
    var image: UIImage!
    var borderColor: UIColor!
    
    init(frame: CGRect, borderColor: UIColor) {
        super.init(frame: frame)
        
        self.image = #imageLiteral(resourceName: "toilet")
        self.borderColor = borderColor
        //self.tag = tag
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let imageView = UIImageView(image: image)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.layer.cornerRadius = 25
        imageView.layer.borderColor = borderColor?.cgColor
        imageView.layer.borderWidth = 4
        imageView.clipsToBounds = true
        
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 45, width: 50, height: 10))
        
        nameLabel.text = "▾"
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.textColor = borderColor
        nameLabel.textAlignment = .center
        
        self.addSubview(imageView)
        self.addSubview(nameLabel)
    }
}
