//
//  PreviewView.swift
//  PoopScoop
//
//  Created by jeff hsu on 8/1/18.
//  Copyright © 2018 Jeffrey Hsu. All rights reserved.
//

import UIKit

class PreviewView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(name: String) {
        nameLabel.text = name
    }
    
    private func setupViews() {
        //addSubview(addressLabel)
        
        addSubview(imgView)
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imgView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        addSubview(addressLabel)
        addressLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        //TO-DO: ADD ADDRESS LABEL
        //TO-DO: ADD RATING LABEL
        //ADD DIRECTIONS LABEL?
        //MIGHT BE ABLE TO USE STACK VIEW??
        
    }
    
    let containerView: UIView = {
        let v=UIView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let imgView: UIImageView = {
        let v=UIImageView()
        v.image = #imageLiteral(resourceName: "toilet")
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let nameLabel: UILabel = {
        let lbl=UILabel()
        lbl.text = "Name"
        lbl.font=UIFont.boldSystemFont(ofSize: 28)
        lbl.textColor = UIColor.black
        lbl.backgroundColor = UIColor.white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rating: 4/5"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.black
        
        return label
    }()
}
