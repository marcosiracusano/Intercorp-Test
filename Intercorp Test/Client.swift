//
//  Client.swift
//  Intercorp Test
//
//  Created by Marco Siracusano on 25/07/2021.
//

import Foundation

struct Client {
    var firstName: String?
    var lastName: String?
    var age: String?
    var dateOfBirth: String?
    
    init(firstName: String?, lastName: String?, age: String?, dateOfBirth: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.dateOfBirth = dateOfBirth
    }
}
