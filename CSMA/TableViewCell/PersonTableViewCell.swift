//
//  PersonTableViewCell.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/18/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var classLabel: UILabel!
    var collegeLabel: UILabel!
    var majorLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        contentView.addSubview(nameLabel)
        
        classLabel = UILabel()
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        classLabel.textAlignment = .center
        classLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(classLabel)
        
        collegeLabel = UILabel()
        collegeLabel.translatesAutoresizingMaskIntoConstraints = false
        collegeLabel.textAlignment = .center
        collegeLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(collegeLabel)
        
        majorLabel = UILabel()
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        majorLabel.textAlignment = .center
        majorLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(majorLabel)
        
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            classLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            classLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            classLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            classLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            collegeLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor),
            collegeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            collegeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            collegeLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            majorLabel.topAnchor.constraint(equalTo: collegeLabel.bottomAnchor),
            majorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            majorLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            majorLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        
        super.updateConstraints()
    }
    
    func configure(for person: Person){
        nameLabel.text = person.name
        classLabel.text = "Class of \(person.year)"
        collegeLabel.text = person.college
        majorLabel.text = person.major
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
