//
//  PostCreationViewController.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/14/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit

class PostCreationViewController: UIViewController, UITextViewDelegate {

    var postView: UIView!
    var postUserLabel: UILabel!
    var postMessageTextView: UITextView!
    var cancelButton: UIButton!
    var postButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            view.backgroundColor = .clear
            view.isOpaque = false
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            view.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
        } else {
            view.backgroundColor = .green
        }
        
        
        postView = UIView()
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.layer.backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        postView.clipsToBounds = true
        postView.layer.cornerRadius = 10
        view.addSubview(postView)
        
        postUserLabel = UILabel()
        postUserLabel.translatesAutoresizingMaskIntoConstraints = false
        postUserLabel.text = "Gonzalo Gonzalez" //to be retrieved from database - current user logged in
        postUserLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postUserLabel.textAlignment = .left
        view.addSubview(postUserLabel)
        
        postMessageTextView = UITextView()
        postMessageTextView.translatesAutoresizingMaskIntoConstraints = false
        postMessageTextView.text = "Start typing here"
        postMessageTextView.textColor = .lightGray
        postMessageTextView.isEditable = true
        postMessageTextView.isScrollEnabled = false
        postMessageTextView.font = UIFont.systemFont(ofSize: 20)
        postMessageTextView.textAlignment = .left
        postMessageTextView.delegate = self
        view.addSubview(postMessageTextView)
        
        cancelButton = UIButton()
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.backgroundColor = .gray
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelPost), for: .touchUpInside)
        cancelButton.layer.cornerRadius = 10
        view.addSubview(cancelButton)
        
        postButton = UIButton()
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.backgroundColor = .gray
        postButton.setTitleColor(.red, for: .normal)
        postButton.setTitle("Post", for: .normal)
        postButton.addTarget(self, action: #selector(createPost), for: .touchUpInside)
        postButton.layer.cornerRadius = 10
        view.addSubview(postButton)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            postView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postView.widthAnchor.constraint(equalToConstant: 250),
            postView.heightAnchor.constraint(equalToConstant: 300)
            ])
        
        NSLayoutConstraint.activate([
            postUserLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 20),
            postUserLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 20),
            postUserLabel.widthAnchor.constraint(equalToConstant: 200),
            postUserLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            postMessageTextView.topAnchor.constraint(equalTo: postUserLabel.topAnchor, constant: 20),
            postMessageTextView.leadingAnchor.constraint(equalTo: postUserLabel.leadingAnchor),
            postMessageTextView.widthAnchor.constraint(equalToConstant: 200),
            postMessageTextView.heightAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: postView.bottomAnchor, constant: 10),
            cancelButton.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 75),
            cancelButton.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: postView.bottomAnchor, constant: 10),
            postButton.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            postButton.widthAnchor.constraint(equalToConstant: 75),
            postButton.heightAnchor.constraint(equalToConstant: 25)
            ])
        
    }
    
    @objc func cancelPost(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func createPost(){
        //to add to database and display on mainfeedviewcontroller
        dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Start typing here"
            textView.textColor = .lightGray
        }
    }


}
