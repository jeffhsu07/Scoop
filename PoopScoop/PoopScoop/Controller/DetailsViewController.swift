//
//  DetailsViewController.swift
//  PoopScoop
//
//  Created by jeff hsu on 7/30/18.
//  Copyright © 2018 Jeffrey Hsu. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var bathroomModel: BathroomModel?
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    let imageView = UIImageView()
    let bathroomNameLabel = UILabel()
    let addressLabel = UILabel()
    let distanceLabel = UILabel()
    let timeEstimateLabel = UILabel()
    let ratingLabel = UILabel()
    
    let labelContainerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        setupSubviews()
        makeConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = bathroomModel?.previewImage
        
        containerView.addSubview(labelContainerView)
        labelContainerView.translatesAutoresizingMaskIntoConstraints = false
        //labelContainerView.backgroundColor = UIColor.red
        
        labelContainerView.addSubview(bathroomNameLabel)
        bathroomNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bathroomNameLabel.text = bathroomModel?.name
        bathroomNameLabel.adjustsFontSizeToFitWidth = true
        bathroomNameLabel.textColor = UIColor.black
        bathroomNameLabel.backgroundColor = UIColor.blue
        
        labelContainerView.addSubview(distanceLabel)
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.text = "0.6 mi"
        distanceLabel.textColor = UIColor.black
        distanceLabel.font = UIFont.systemFont(ofSize: 12)
        distanceLabel.backgroundColor = UIColor.brown
        
        labelContainerView.addSubview(timeEstimateLabel)
        timeEstimateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeEstimateLabel.text = "5 min"
        timeEstimateLabel.textColor = UIColor.black
        timeEstimateLabel.font = UIFont.systemFont(ofSize: 12)
        timeEstimateLabel.backgroundColor = UIColor.purple
        
        labelContainerView.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.text = bathroomModel?.address
        addressLabel.adjustsFontSizeToFitWidth = true
        addressLabel.textColor = UIColor.black
        
        labelContainerView.addSubview(ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Rating: \(bathroomModel?.rating)/5"
        ratingLabel.adjustsFontSizeToFitWidth = true
        ratingLabel.textColor = UIColor.black
    }
    
    private func makeConstraints() {
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.contentSize.height = 800
        
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.45).isActive = true
        
        labelContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        labelContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        labelContainerView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        labelContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.15).isActive = true
        
        bathroomNameLabel.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor).isActive = true
        bathroomNameLabel.rightAnchor.constraint(equalTo: distanceLabel.leftAnchor).isActive = true
        bathroomNameLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor).isActive = true
        bathroomNameLabel.heightAnchor.constraint(equalTo: labelContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        distanceLabel.leftAnchor.constraint(equalTo: bathroomNameLabel.rightAnchor).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor).isActive = true
        distanceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        distanceLabel.rightAnchor.constraint(equalTo: timeEstimateLabel.leftAnchor).isActive = true
        distanceLabel.heightAnchor.constraint(equalTo: bathroomNameLabel.heightAnchor).isActive = true
        
        timeEstimateLabel.leftAnchor.constraint(equalTo: distanceLabel.rightAnchor).isActive = true
        timeEstimateLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor).isActive = true
        timeEstimateLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        timeEstimateLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor).isActive = true
        timeEstimateLabel.heightAnchor.constraint(equalTo: bathroomNameLabel.heightAnchor).isActive = true
        
        addressLabel.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: bathroomNameLabel.bottomAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: labelContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        ratingLabel.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: labelContainerView.heightAnchor, multiplier: 1/3).isActive = true
    }
}
