//
//  ProfileViewController.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/9/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var nameLabel: UILabel!
    var classLabel: UILabel!
    var schoolLabel: UILabel!
    var majorLabel: UILabel!
    var followOrEditButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Gonzalo Gonzalez" //to be retrieved by database
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(nameLabel)
        
        classLabel = UILabel()
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        classLabel.text = "Class of 2018" //to be retrieved by database
        classLabel.textAlignment = .center
        classLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(classLabel)
        
        schoolLabel = UILabel()
        schoolLabel.translatesAutoresizingMaskIntoConstraints = false
        schoolLabel.text = "College of Engineering" //to be retrieved by database
        schoolLabel.textAlignment = .center
        schoolLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(schoolLabel)
        
        majorLabel = UILabel()
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        majorLabel.text = "Computer Science" //to be retrieved by database
        majorLabel.textAlignment = .center
        majorLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(majorLabel)
        
        followOrEditButton = UIButton()
        followOrEditButton.translatesAutoresizingMaskIntoConstraints = false
        followOrEditButton.setTitle("Follow", for: .normal) //to be determined by whether or not the profile belongs to currently logged id
        followOrEditButton.setTitleColor(.white, for: .normal)
        followOrEditButton.backgroundColor = .clear
        followOrEditButton.layer.borderWidth = 1
        followOrEditButton.layer.borderColor = UIColor.white.cgColor
        followOrEditButton.layer.cornerRadius = 5
        view.addSubview(followOrEditButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            classLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            classLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            classLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            classLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            schoolLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            schoolLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 20),
            schoolLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            schoolLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            majorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            majorLabel.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor, constant: 20),
            majorLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            majorLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            followOrEditButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            followOrEditButton.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: 30),
            followOrEditButton.widthAnchor.constraint(equalToConstant: 100),
            followOrEditButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }

}
