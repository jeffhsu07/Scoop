//
//  DetailsViewController.swift
//  PoopScoop
//
//  Created by jeff hsu on 7/30/18.
//  Copyright © 2018 Jeffrey Hsu. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        setupViews()
    }
    
    private func setupViews() {
        self.view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.contentSize.height = 800
        
        self.view.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        containerView.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        containerView.addSubview(bathroomNameLabel)
        bathroomNameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive = true
        bathroomNameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15).isActive = true
        bathroomNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        bathroomNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.addSubview(bathroomDescriptionLabel)
        bathroomDescriptionLabel.leftAnchor.constraint(equalTo: bathroomNameLabel.leftAnchor).isActive = true
        bathroomDescriptionLabel.rightAnchor.constraint(equalTo: bathroomNameLabel.rightAnchor).isActive = true
        bathroomDescriptionLabel.topAnchor.constraint(equalTo: bathroomNameLabel.bottomAnchor, constant: 10).isActive = true
        bathroomDescriptionLabel.text = "SWAGGY SWAGGY DADDY"
        bathroomDescriptionLabel.sizeToFit()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    let containerView: UIView = {
       let containerView = UIView()
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        //TO-DO: PUT IN IMAGE imageView.image = #imageLiteral(resourceName: "bathroom1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let bathroomNameLabel: UILabel = {
        let bathroomNameLabel = UILabel()
        
        bathroomNameLabel.text = "Name"
        bathroomNameLabel.font = UIFont.systemFont(ofSize: 28)
        bathroomNameLabel.textColor = UIColor.black
        bathroomNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return bathroomNameLabel
    }()
    
    let bathroomDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Description"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
}
