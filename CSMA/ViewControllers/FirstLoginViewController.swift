//
//  FirstLoginViewController.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/29/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit
import Firebase

class FirstLoginViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //Visuals
    var welcomeLabel: UILabel!
    var nameTextField: UITextField!
    var classPicker: UIPickerView!
    var collegePicker: UIPickerView!
    var majorPicker: UIPickerView!
    var continueButton: UIButton!
    
    //Alerts
    var fillAllFieldsAlert: UIAlertController!
    
    //Data
    var ref: DatabaseReference!
    
    //Picker View DataSources
    var classPickerDataSource: [String] = ["Class Year","2019", "2020", "2021", "2022"]
    var collegePickerDataSource: [String] = ["College", "College of Agriculture and Life Sciences", "College of Architecture, Art and Planning", "College of Arts and Sciences", "Cornell SC Johnson College of Business", "College of Engineering", "College of Human Ecology", "School of Industrial and Labor Relations (ILR)"]
    var majorPickerDataSource: [String] = ["Major", "Undecided", "Africana Studies", "Agricultural Sciences", "American Studies", "Animal Science", "Anthropology", "Applied Economics and Management", "Archaeology", "Architecture", "Asian Studies", "Astronomy", "Atmospheric Science", "Biological Engineering", "Biological Sciences", "Biology and Society", "Biomedical Engineering", "Biometry and Statistics", "Chemical Engineering", "Chemistry and Chemical Biology", "China and Asia-Pacific Studies", "Civil Engineering", "Classics (Classics, Classical Civ., Greek, Latin)", "College Scholar Program", "Communication", "Comparative Literature", "Computer Science", "Design and Environmental Analysis", "Development Sociology", "Earth and Atmospheric Sciences", "Economics", "Electrical and Computer Engineering", "Engineering Physics", "English", "Entomology", "Environmental and Sustainability Sciences", "Environmental Engineering", "Feminist, Gender & Sexuality Studies", "Fiber Science and Apparel Design", "Fine Arts", "Food Science", "French", "German Studies", "Global & Public Health Sciences", "Government", "History", "History of Architecture", "History of Art", "Hotel Administration", "Human Biology, Health and Society", "Human Development", "Independent Major - Arts and Sciences", "Independent Major - Engineering", "Industrial and Labor Relations", "Information Science", "Information Science, Systems, and Technology", "Interdisciplinary Studies", "International Agriculture and Rural Development", "Italian", "Landscape Architecture", "Linguistics", "Materials Science and Engineering", "Mathematics", "Mechnical Engineering", "Music", "Near Eastern Studies", "Nutritional Sciences", "Operations Research and Engineering", "Performing and Media Arts", "Philosophy", "Physics", "Plant Sciences", "Policy Analysis and Management", "Psychology", "Religious Studies", "Science and Technology Studies", "Sociology", "Spanish", "Statistical Science", "Urban and Regional Studies", "Viticulture and Enology"]
    
    //Selected Choices
    var classOf: String = "Class Year"
    var college: String = "College"
    var major: String = "Major"
    
    //Colors
    let burgundy = UIColor.init(red: 128/255, green: 0/255, blue: 32/255, alpha: 1)
    let carnelian = UIColor.init(red: 179/255, green: 27/255, blue: 27/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = burgundy
        navigationController?.isNavigationBarHidden = true
        ref = Database.database().reference() //EXTREMELY IMPORTANT DO NOT FORGET THIS OR ERRORS WITH OPTIONALS WILL APPEAR
        
        welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.numberOfLines = 0 //allows for newline operator to work
        welcomeLabel.text = "Welcome to CSMA!\nTell us a little about yourself."
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        welcomeLabel.textAlignment = .center
        view.addSubview(welcomeLabel)
        
        nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.attributedPlaceholder = NSAttributedString(string: "What's your name?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]) //allows us to create a placeholder with white text color
        nameTextField.backgroundColor = carnelian
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
        
        classPicker = UIPickerView()
        classPicker.translatesAutoresizingMaskIntoConstraints = false
        classPicker.dataSource = self
        classPicker.delegate = self
        view.addSubview(classPicker)
        
        collegePicker = UIPickerView()
        collegePicker.translatesAutoresizingMaskIntoConstraints = false
        collegePicker.dataSource = self
        collegePicker.delegate = self
        view.addSubview(collegePicker)
        
        majorPicker = UIPickerView()
        majorPicker.translatesAutoresizingMaskIntoConstraints = false
        majorPicker.dataSource = self
        majorPicker.delegate = self
        view.addSubview(majorPicker)
        
        continueButton = UIButton()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.backgroundColor = .white
        continueButton.setTitleColor(carnelian, for: .normal)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.addTarget(self, action: #selector(goToFeed), for: .touchUpInside)
        continueButton.layer.cornerRadius = 10
        view.addSubview(continueButton)
        
        fillAllFieldsAlert = UIAlertController(title: "Empty Fields",
                                                message: "Please fill out all fields before continuing",
                                                preferredStyle: .alert)
        fillAllFieldsAlert.addAction(UIAlertAction(title: "Whoops", style: .default, handler: nil))
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 50),
            welcomeLabel.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            nameTextField.widthAnchor.constraint(equalToConstant: 350),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            classPicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            classPicker.heightAnchor.constraint(equalToConstant: 100),
            classPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            collegePicker.topAnchor.constraint(equalTo: classPicker.bottomAnchor, constant: 25),
            collegePicker.heightAnchor.constraint(equalToConstant: 100),
            collegePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            majorPicker.topAnchor.constraint(equalTo: collegePicker.bottomAnchor, constant: 30),
            majorPicker.heightAnchor.constraint(equalToConstant: 150),
            majorPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            continueButton.widthAnchor.constraint(equalToConstant: 300),
            continueButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    @objc func goToFeed(){
        let enteredName = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let enteredYear = classOf
        let enteredCollege = college
        let enteredMajor = major
        if (enteredName == "" || enteredYear == "Class Year" || enteredCollege == "College" || enteredMajor == "Major"){
            present(fillAllFieldsAlert, animated: true, completion: nil)
        } else {
            ref.child("userInfo").child(AppDelegate.CurrentUser.loggedUserID).setValue(["name": enteredName, "year": enteredYear, "college": enteredCollege, "major": enteredMajor])
            navigationController?.popViewController(animated: true)
            //FireBase has a request pending that will pushing the feed; avoiding pushing here to prevent double-pushing
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == classPicker{
            return classPickerDataSource.count
        } else if pickerView == collegePicker{
            return collegePickerDataSource.count
        } else{
            return majorPickerDataSource.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == classPicker{
            classOf = classPickerDataSource[row]
        } else if pickerView == collegePicker{
            college = collegePickerDataSource[row]
        } else{
            major = majorPickerDataSource[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont.systemFont(ofSize: 14)
            pickerLabel?.textAlignment = .center
        }
        
        if pickerView == classPicker{
            pickerLabel?.text = classPickerDataSource[row]
        } else if pickerView == collegePicker{
            pickerLabel?.text = collegePickerDataSource[row]
        } else{
            pickerLabel?.text = majorPickerDataSource[row]
        }
        
        return pickerLabel!
    }

}
