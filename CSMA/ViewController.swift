//
//  ViewController.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/7/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Visuals
    var usernameLabel: UILabel!
    var usernameTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    //Data
    var usernames = ["Chalo2000", "Papi"]
    var passwords = ["Cornell", "123abc"]
    
    //Alerts
    var emptyFieldAlert: UIAlertController!
    var incorrectLoginInfoAlert: UIAlertController!
    var successfulLoginAlert: UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 153/255, green: 230/255, blue: 255/255, alpha: 1)
        
        usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Username"
        usernameLabel.textAlignment = .center
        view.addSubview(usernameLabel)
        
        usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Enter your username"
        usernameTextField.borderStyle = .roundedRect
        view.addSubview(usernameTextField)
        
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.textAlignment = .center
        view.addSubview(passwordLabel)
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.borderStyle = .roundedRect
        view.addSubview(passwordTextField)
        
        loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .gray
        loginButton.setTitleColor(.red, for: .normal)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(attemptLogin), for: .touchUpInside)
        loginButton.layer.cornerRadius = 10
        view.addSubview(loginButton)
        
        emptyFieldAlert = UIAlertController(title: "Empty fields",
                                               message: "Please fill out all fields before logging in",
                                               preferredStyle: .alert)
        emptyFieldAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        incorrectLoginInfoAlert = UIAlertController(title: "Incorrect Login Information",
                                               message: "Please enter a valid username and password",
                                               preferredStyle: .alert)
        incorrectLoginInfoAlert.addAction(UIAlertAction(title: "Oops", style: .default, handler: nil))
        
        successfulLoginAlert = UIAlertController(title: "Welcome",
                                                 message: "You have successfully logged in",
                                                 preferredStyle: .alert)
        successfulLoginAlert.addAction(UIAlertAction(title: "Great!", style: .default, handler: nil))
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            usernameLabel.widthAnchor.constraint(equalToConstant: 100),
            usernameLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: usernameLabel.centerXAnchor),
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
            usernameTextField.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            passwordLabel.centerXAnchor.constraint(equalTo: usernameTextField.centerXAnchor),
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 100),
            passwordLabel.widthAnchor.constraint(equalToConstant: 100),
            passwordLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: passwordLabel.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginButton.widthAnchor.constraint(equalToConstant: 50),
            loginButton.heightAnchor.constraint(equalToConstant: 25)
            ])
        
    }
    
    @objc func attemptLogin(){
        let enteredUsername = usernameTextField.text
        let enteredPassword = passwordTextField.text
        
        if (enteredUsername == "" || enteredPassword == ""){
            present(emptyFieldAlert, animated: true, completion: nil)
        } else {
            
            let indexOfUsername = usernames.firstIndex(of: enteredUsername!)
            
            if (indexOfUsername != nil && passwords[indexOfUsername!] == enteredPassword) {
                present(successfulLoginAlert, animated: true, completion: nil)
            } else {
                present(incorrectLoginInfoAlert, animated: true, completion: nil)
            }
            
        }
        
        
    }


}

