//
//  LoginViewControllerTests.swift
//  Intercorp TestTests
//
//  Created by Marco Siracusano on 26/07/2021.
//

import XCTest
@testable import Intercorp_Test

class LoginViewControllerTests: XCTestCase {

    var sut: LoginViewController!
    
    
    override func setUp() {
        super.setUp()
        sut = LoginViewController()
        let _ = sut.view
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func test_init_shouldCreateLoginButton() {
        XCTAssertNotNil(sut.loginButton)
        XCTAssertEqual(sut.loginButton.title(for: .normal), "Iniciar sesión")
        XCTAssertEqual(sut.loginButton.titleColor(for: .normal), .blue)
        XCTAssertFalse(sut.loginButton.gestureRecognizers?.isEmpty ?? true)
    }
    
    func test_init_viewShouldHaveLoginButtonAsSubview() {
        XCTAssertFalse(sut.view.subviews.isEmpty)
        XCTAssertEqual(sut.view.subviews.count, 1)
        XCTAssertEqual(sut.view.subviews[0], sut.loginButton)
    }
    
    func test_viewDidLoad_backgroundColorShouldBeWhite() {
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
}
