//
//  PreviewView.swift
//  PoopScoop
//
//  Created by jeff hsu on 8/1/18.
//  Copyright © 2018 Jeffrey Hsu. All rights reserved.
//

import UIKit

class PreviewView: UIView {
    
    let bathroomThumbnailView = UIImageView()
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let ratingLabel = UILabel()
    let viewReviewsButton = UIButton()
    let labelContainerView = UIView()
    let imageContainerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        
        setupSubviews()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        //MARK: imageContainerView
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageContainerView)
        
        //MARK: labelContainerView
        labelContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelContainerView)
        
        //MARK: ImageView
        bathroomThumbnailView.translatesAutoresizingMaskIntoConstraints = false
        bathroomThumbnailView.image = #imageLiteral(resourceName: "toilet")
        imageContainerView.addSubview(bathroomThumbnailView)
        
        //MARK: nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Icon Plaza"
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = UIColor.black
        labelContainerView.addSubview(nameLabel)
        
        //MARK: addressLabel
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.text = "3584 S. Figueroa Street, Los Angeles, CA, 90007"
        addressLabel.adjustsFontSizeToFitWidth = true
        addressLabel.textColor = UIColor.black
        labelContainerView.addSubview(addressLabel)
        
        //MARK: ratingLabel
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Rating: 4/5"
        ratingLabel.adjustsFontSizeToFitWidth = true
        ratingLabel.textColor = UIColor.black
        labelContainerView.addSubview(ratingLabel)
        
        //MARK: ViewReviewButton
        viewReviewsButton.translatesAutoresizingMaskIntoConstraints = false
        viewReviewsButton.setTitle("See Reviews", for: .normal)
        viewReviewsButton.backgroundColor = UIColor.blue
        addSubview(viewReviewsButton)
        
        
    }
    
    private func makeConstraints() {
        imageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.667).isActive = true
        imageContainerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        imageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        bathroomThumbnailView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        bathroomThumbnailView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        bathroomThumbnailView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor, multiplier: 0.75).isActive = true
        bathroomThumbnailView.heightAnchor.constraint(equalTo: bathroomThumbnailView.widthAnchor).isActive = true
        
        labelContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelContainerView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor).isActive = true
        labelContainerView.leftAnchor.constraint(equalTo: imageContainerView.rightAnchor, constant: 5).isActive = true
        labelContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: addressLabel.heightAnchor).isActive = true
        
        addressLabel.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: ratingLabel.heightAnchor).isActive = true
        
        ratingLabel.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 2).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: addressLabel.heightAnchor).isActive = true
        
        viewReviewsButton.topAnchor.constraint(equalTo: labelContainerView.bottomAnchor).isActive = true
        viewReviewsButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        viewReviewsButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        viewReviewsButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
