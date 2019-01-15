//
//  MainFeedViewController.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/9/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit

class MainFeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var feedCollectionView: UICollectionView!
    let feedReuseIdentifier = "feedReuseIdentifier"
    
    var postButton: UIButton!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post1 = Post(poster: "Donald Trump", message: "Build a wall Build a wall Build a wall Build a wall Build a wall Build a wall Build a wall Build a wall Build a wall Build a wall Build a wall Build a wall")
        let post2 = Post(poster: "Hien Nyguen" , message: "Never lose")
        let post3 = Post(poster: "Derik Deliard", message: "Let's reschedule")
        
        posts = [post1, post2, post3]
        
        
        view.backgroundColor = .green

        let feedLayout = UICollectionViewFlowLayout()
        feedLayout.scrollDirection = .vertical
        feedLayout.minimumInteritemSpacing = 16
        feedLayout.sectionInset = UIEdgeInsets(top: 25, left: 0, bottom: 5, right: 0)
        feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: feedLayout)
        feedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        feedCollectionView.backgroundColor = view.backgroundColor
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        feedCollectionView.alwaysBounceVertical = true
        feedCollectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: feedReuseIdentifier)
        feedCollectionView.reloadData()
        view.addSubview(feedCollectionView)
        
        postButton = UIButton()
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.setImage(UIImage(named: "Post Icon"), for: .normal)
        postButton.backgroundColor = .white
        postButton.layer.cornerRadius = 10
        postButton.addTarget(self, action: #selector(makePost), for: .touchUpInside)
        view.addSubview(postButton)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -15),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            postButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            postButton.widthAnchor.constraint(equalToConstant: 50),
            postButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func makePost(){
        let postCreationViewController = PostCreationViewController()
        postCreationViewController.modalPresentationStyle = .overCurrentContext
        postCreationViewController.modalTransitionStyle = .flipHorizontal
        present(postCreationViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: feedReuseIdentifier, for: indexPath) as! FeedCollectionViewCell
        let post = posts[indexPath.item]
        cell.configure(with: post)
        cell.setNeedsUpdateConstraints()
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 300)
    }

}
