//
//  LoginViewController.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/9/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    //Visuals
    var usernameLabel: UILabel!
    var usernameTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var signupButton: UIButton!
    var loginSignupButton: UIButton!
    var loginSignupSwitcherButton: UIButton!
    
    //Data
    var ref: DatabaseReference!
    
    //Alerts
    var emptyFieldAlert: UIAlertController!
    var incorrectLoginInfoAlert: UIAlertController!
    var successfulLoginAlert: UIAlertController!
    var usernameExistsAlert: UIAlertController!
    var successfulSignupAlert: UIAlertController!
    
    //Colors
    let burgundy = UIColor.init(red: 128/255, green: 0/255, blue: 32/255, alpha: 1)
    let carnelian = UIColor.init(red: 179/255, green: 27/255, blue: 27/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = burgundy
        navigationController?.isNavigationBarHidden = true
        ref = Database.database().reference()
        
        usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Username"
        usernameLabel.textColor = .white
        usernameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        usernameLabel.textAlignment = .center
        view.addSubview(usernameLabel)
        
        usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]) //allows us to create a placeholder with white text color
        usernameTextField.backgroundColor = carnelian
        usernameTextField.borderStyle = .roundedRect
        view.addSubview(usernameTextField)
        
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        passwordLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        passwordLabel.textAlignment = .center
        view.addSubview(passwordLabel)
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]) //allows us to create a placeholder with white text color
        passwordTextField.backgroundColor = carnelian
        passwordTextField.borderStyle = .roundedRect
        view.addSubview(passwordTextField)
        
        loginSignupButton = UIButton()
        loginSignupButton.translatesAutoresizingMaskIntoConstraints = false
        loginSignupButton.backgroundColor = .white
        loginSignupButton.setTitleColor(carnelian, for: .normal)
        loginSignupButton.setTitle("Login", for: .normal)
        loginSignupButton.addTarget(self, action: #selector(processAction), for: .touchUpInside)
        loginSignupButton.layer.cornerRadius = 10
        view.addSubview(loginSignupButton)
        
        loginSignupSwitcherButton = UIButton()
        loginSignupSwitcherButton.translatesAutoresizingMaskIntoConstraints = false
        loginSignupSwitcherButton.backgroundColor = .clear
        loginSignupSwitcherButton.setTitleColor(.gray, for: .normal)
        loginSignupSwitcherButton.setTitle("Don't have an account yet? Press here to sign up!", for: .normal)
        loginSignupSwitcherButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        loginSignupSwitcherButton.titleLabel?.textAlignment = .center
        loginSignupSwitcherButton.addTarget(self, action: #selector(switchMode), for: .touchUpInside)
        view.addSubview(loginSignupSwitcherButton)
        
        
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
        
        usernameExistsAlert = UIAlertController(title: "Username Already Exists",
                                               message: "The username you have entered already exists. Try using the login button",
                                               preferredStyle: .alert)
        usernameExistsAlert.addAction(UIAlertAction(title: "Alright", style: .default, handler: nil))
        
        successfulSignupAlert = UIAlertController(title: "Signup Successful",
                                                message: "You have successfully signed up for CSMA! You can now log in.",
                                                preferredStyle: .alert)
        successfulSignupAlert.addAction(UIAlertAction(title: "Great", style: .default, handler: nil))
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            usernameLabel.widthAnchor.constraint(equalToConstant: 100),
            usernameLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            usernameTextField.widthAnchor.constraint(equalToConstant: 350),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 100),
            passwordLabel.widthAnchor.constraint(equalToConstant: 100),
            passwordLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: 350),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            loginSignupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginSignupButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            loginSignupButton.widthAnchor.constraint(equalToConstant: 300),
            loginSignupButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            loginSignupSwitcherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginSignupSwitcherButton.topAnchor.constraint(equalTo: loginSignupButton.bottomAnchor, constant: 10),
            loginSignupSwitcherButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            loginSignupSwitcherButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
    }
    
    @objc func processAction(){
        if (loginSignupButton.currentTitle == "Login"){
            attemptLogin()
        } else if (loginSignupButton.currentTitle == "Sign Up"){
            attemptSignup()
        } else {
            print("Something went wrong in processAction")
        }
    }
    
    @objc func switchMode(){
        if (loginSignupButton.currentTitle == "Login"){
            usernameTextField.attributedPlaceholder = NSAttributedString(string: "Create your username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Create your password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            loginSignupButton.setTitle("Sign Up", for: .normal)
            loginSignupSwitcherButton.setTitle("Already have an account? Press here to login!", for: .normal)
        } else {
            usernameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            loginSignupButton.setTitle("Login", for: .normal)
            loginSignupSwitcherButton.setTitle("Don't have an account yet? Press here to sign up!", for: .normal)
        }
    }
    
    @objc func attemptLogin(){
        let enteredUsername = usernameTextField.text
        let enteredPassword = passwordTextField.text

        if (enteredUsername == "" || enteredPassword == ""){
            present(emptyFieldAlert, animated: true, completion: nil)
        } else {

            ref.child("loginInfo").observe(.value) { snapshot in
                for userID in snapshot.children.allObjects as! [DataSnapshot]{
                    if (userID.childSnapshot(forPath: "username").value! as? String == enteredUsername && userID.childSnapshot(forPath: "password").value! as? String == enteredPassword){
                self.navigationController?.pushViewController(TabSetupViewController(), animated: true)
                        return
                        //if the username and password match a combo in the database, log in
                    }
                }
                //otherwise, present login error
                self.present(self.incorrectLoginInfoAlert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func attemptSignup(){
        let newUsername = usernameTextField.text!
        let newPassword = passwordTextField.text!
        
        if (newUsername == "" || newPassword == ""){
            present(emptyFieldAlert, animated: true, completion: nil)
        } else{
            ref.child("loginInfo").observe(.value) { snapshot in
                for userID in snapshot.children.allObjects as! [DataSnapshot]{
                    if (userID.childSnapshot(forPath: "username").value! as? String == newUsername){
                        self.present(self.usernameExistsAlert, animated: true, completion: nil)
                        return
                        //if username already exists, gets out of closure
                    }
                }
                //otherwise, add the new info into the database
                self.ref.child("loginInfo").childByAutoId().setValue(["username": newUsername, "password": newPassword])
                self.present(self.successfulSignupAlert, animated: true, completion: nil)
            }
        }
    }
}
