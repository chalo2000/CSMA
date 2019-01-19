//
//  Person.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/17/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var year: Int
    var college: String
    var major: String
    
    init(name: String, year: Int, college: String, major: String){
        self.name = name
        self.year = year
        self.college = college
        self.major = major
    }
}
