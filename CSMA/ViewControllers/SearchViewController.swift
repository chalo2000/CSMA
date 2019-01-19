//
//  SearchViewController.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/9/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    var searchPeopleController: UISearchController!
    var peopleTableView: UITableView!
    let peopleReusableIdentifier = "peopleReusableIdentifier"
    
    var peopleDatabase: [Person] = []
    var matchingPeople: [Person] = []
    
    override func viewWillDisappear(_ animated: Bool) {
        searchPeopleController.isActive = false //fixes the issue of the searchbar carrying over to other tabs
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let person1 = Person(name: "Gonzalo Gonzalez", year: 2018, college: "College of Engineering", major: "Computer Science")
        let person2 = Person(name: "Raxel Gutierrez", year: 2018, college: "MIT", major: "Computer Science")
        let person3 = Person(name: "Maximus Garcia", year: 2018, college: "FIU", major: "Accounting")
        let person4 = Person(name: "Gregory Perez", year: 2018, college: "College of Engineering", major: "Electrical and Computer Engineering")
        
        peopleDatabase = [person1, person2, person3, person4]
        
        peopleTableView = UITableView(frame: .zero)
        peopleTableView.translatesAutoresizingMaskIntoConstraints = false
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        peopleTableView.register(PersonTableViewCell.self, forCellReuseIdentifier: peopleReusableIdentifier)
        view.addSubview(peopleTableView)
        
        searchPeopleController = UISearchController(searchResultsController: nil)
        searchPeopleController.searchResultsUpdater = self
        searchPeopleController.dimsBackgroundDuringPresentation = false
        searchPeopleController.searchBar.placeholder = "Find people"
        searchPeopleController.searchBar.sizeToFit()
        view.addSubview(searchPeopleController.searchBar)

        setupConstraints()
    }
    
    func setupConstraints(){
        
        let peopleSearchBar = searchPeopleController.searchBar
        peopleSearchBar.searchFieldBackgroundPositionAdjustment = UIOffset(horizontal: 0, vertical: 7) //so the searchbar doesn't intersect with wifi, time, battery icons
        
        NSLayoutConstraint.activate([
            peopleTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            peopleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            peopleTableView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchPeopleController.searchBar.text {
            matchingPeople = [] //reset the current matching people
            if !searchText.isEmpty {
                for person in peopleDatabase{
                    if person.name.lowercased().range(of: searchText.lowercased()) != nil{
                        matchingPeople.append(person) //if a match is found, add to matching people
                    }
                }
            }
            peopleTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: peopleReusableIdentifier, for: indexPath) as! PersonTableViewCell
        let person = matchingPeople[indexPath.row]
        cell.configure(for: person)
        cell.setNeedsUpdateConstraints()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
