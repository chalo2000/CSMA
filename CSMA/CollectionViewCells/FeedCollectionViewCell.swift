//
//  FeedCollectionViewCell.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/13/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    var postUserLabel: UILabel!
    var postMessageTextView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        
        postUserLabel = UILabel()
        postUserLabel.translatesAutoresizingMaskIntoConstraints = false
        postUserLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postUserLabel.textAlignment = .left
        contentView.addSubview(postUserLabel)
        
        postMessageTextView = UITextView()
        postMessageTextView.translatesAutoresizingMaskIntoConstraints = false
        postMessageTextView.isEditable = false
        postMessageTextView.isScrollEnabled = false
        postMessageTextView.font = UIFont.systemFont(ofSize: 20)
        postMessageTextView.textAlignment = .left
        contentView.addSubview(postMessageTextView)
        
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            postUserLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            postUserLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            postUserLabel.widthAnchor.constraint(equalToConstant: 200),
            postUserLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            postMessageTextView.topAnchor.constraint(equalTo: postUserLabel.topAnchor, constant: 20),
            postMessageTextView.leadingAnchor.constraint(equalTo: postUserLabel.leadingAnchor),
            postMessageTextView.widthAnchor.constraint(equalToConstant: 200),
            postMessageTextView.heightAnchor.constraint(equalToConstant: 300)
            ])
        
        super.updateConstraints()
    }
    
    func configure(with post: Post){
        postUserLabel.text = post.poster
        postMessageTextView.text = post.message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
