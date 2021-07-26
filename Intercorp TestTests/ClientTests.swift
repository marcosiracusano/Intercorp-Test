//
//  ClientTests.swift
//  Intercorp TestTests
//
//  Created by Marco Siracusano on 26/07/2021.
//

import XCTest
@testable import Intercorp_Test

class ClientTests: XCTestCase {

    var sut: Client!
    
    
    override func setUp() {
        super.setUp()
        sut = Client(firstName: "firstName", lastName: "lastName", age: "age", dateOfBirth: "dateOfBirth")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func test_init_shouldAssignCorrectFirstName() {
        XCTAssertEqual(sut.firstName, "firstName")
    }
    
    func test_init_shouldAssignCorrectLastName() {
        XCTAssertEqual(sut.lastName, "lastName")
    }
    
    func test_init_shouldAssignCorrectAge() {
        XCTAssertEqual(sut.age, "age")
    }
    
    func test_init_shouldAssignCorrectDateOfBirth() {
        XCTAssertEqual(sut.dateOfBirth, "dateOfBirth")
    }
}
