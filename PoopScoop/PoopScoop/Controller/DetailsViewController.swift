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
        
        containerView.addSubview(bathroomNameLabel)
        bathroomNameLabel.text = bathroomModel?.name
        bathroomNameLabel.adjustsFontSizeToFitWidth = true
        bathroomNameLabel.textColor = UIColor.black
        bathroomNameLabel.translatesAutoresizingMaskIntoConstraints = false
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
        
        containerView.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.4).isActive = true
        
        containerView.addSubview(bathroomNameLabel)
        bathroomNameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive = true
        bathroomNameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15).isActive = true
        bathroomNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        bathroomNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
