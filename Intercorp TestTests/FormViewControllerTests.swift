//
//  FormViewControllerTests.swift
//  Intercorp TestTests
//
//  Created by Marco Siracusano on 25/07/2021.
//

import XCTest
@testable import Intercorp_Test

class FormViewControllerTests: XCTestCase {

    var sut: FormViewController!
    
    
    override func setUp() {
        super.setUp()
        sut = FormViewController()
        let _ = sut.view
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func test_init_shouldCreateTitleLabel() {
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertEqual(sut.titleLabel.text, "Creación de Cliente")
        XCTAssertEqual(sut.titleLabel.font, .boldSystemFont(ofSize: 25))
        XCTAssertEqual(sut.titleLabel.textColor, .black)
    }
    
    func test_init_shouldCreateFirstNameTextField() {
        XCTAssertNotNil(sut.firstNameTextField)
        XCTAssertEqual(sut.firstNameTextField.placeholder, "Nombre")
        XCTAssertEqual(sut.firstNameTextField.borderStyle, .roundedRect)
        XCTAssertEqual(sut.firstNameTextField.backgroundColor, .white)
        XCTAssertEqual(sut.firstNameTextField.textColor, .darkGray)
        XCTAssertEqual(sut.firstNameTextField.spellCheckingType, .no)
        XCTAssertEqual(sut.firstNameTextField.autocorrectionType, .no)
        XCTAssertFalse(sut.firstNameTextField.allTargets.isEmpty)
    }
    
    func test_init_shouldCreateLastNameTextField() {
        XCTAssertNotNil(sut.lastNameTextField)
        XCTAssertEqual(sut.lastNameTextField.placeholder, "Apellido")
        XCTAssertEqual(sut.lastNameTextField.borderStyle, .roundedRect)
        XCTAssertEqual(sut.lastNameTextField.backgroundColor, .white)
        XCTAssertEqual(sut.lastNameTextField.textColor, .darkGray)
        XCTAssertEqual(sut.lastNameTextField.spellCheckingType, .no)
        XCTAssertEqual(sut.lastNameTextField.autocorrectionType, .no)
        XCTAssertFalse(sut.lastNameTextField.allTargets.isEmpty)
    }
    
    func test_init_shouldCreateAgeTextField() {
        XCTAssertNotNil(sut.ageTextField)
        XCTAssertEqual(sut.ageTextField.placeholder, "Edad")
        XCTAssertEqual(sut.ageTextField.borderStyle, .roundedRect)
        XCTAssertEqual(sut.ageTextField.backgroundColor, .white)
        XCTAssertEqual(sut.ageTextField.textColor, .darkGray)
        XCTAssertEqual(sut.ageTextField.spellCheckingType, .no)
        XCTAssertEqual(sut.ageTextField.autocorrectionType, .no)
        XCTAssertFalse(sut.ageTextField.allTargets.isEmpty)
    }
    
    func test_init_shouldCreateDateOfBirthTextField() {
        XCTAssertNotNil(sut.dateOfBirthTextField)
        XCTAssertEqual(sut.dateOfBirthTextField.placeholder, "Fecha de nacimiento")
        XCTAssertEqual(sut.dateOfBirthTextField.borderStyle, .roundedRect)
        XCTAssertEqual(sut.dateOfBirthTextField.backgroundColor, .white)
        XCTAssertEqual(sut.dateOfBirthTextField.textColor, .darkGray)
        XCTAssertEqual(sut.dateOfBirthTextField.spellCheckingType, .no)
        XCTAssertEqual(sut.dateOfBirthTextField.autocorrectionType, .no)
        XCTAssertFalse(sut.dateOfBirthTextField.allTargets.isEmpty)
    }
    
    func test_init_shouldCreateDatePicker() {
        XCTAssertNotNil(sut.datePicker)
        XCTAssertEqual(sut.datePicker.datePickerMode, .date)
        XCTAssertEqual(sut.datePicker.preferredDatePickerStyle, .wheels)
        XCTAssertFalse(sut.datePicker.allTargets.isEmpty)
    }
    
    func test_init_shouldCreateSaveButton() {
        XCTAssertNotNil(sut.saveButton)
        XCTAssertEqual(sut.saveButton.title(for: .normal), "Guardar")
        XCTAssertEqual(sut.saveButton.titleColor(for: .normal), .blue)
        XCTAssertEqual(sut.saveButton.titleColor(for: .disabled), .gray)
        XCTAssertFalse(sut.saveButton.isEnabled)
    }
    
    func test_init_shouldCreateLogoutButton() {
        XCTAssertNotNil(sut.logoutButton)
        XCTAssertEqual(sut.logoutButton.title(for: .normal), "Cerrar sesión")
        XCTAssertEqual(sut.logoutButton.titleColor(for: .normal), .red)
        XCTAssertEqual(sut.logoutButton.titleColor(for: .disabled), .gray)
        XCTAssertTrue(sut.logoutButton.isEnabled)
    }
    
    func test_init_shouldCreateMainStackView() {
        XCTAssertNotNil(sut.mainStackView)
        XCTAssertEqual(sut.mainStackView.axis, .vertical)
        XCTAssertEqual(sut.mainStackView.distribution, .fillEqually)
        XCTAssertEqual(sut.mainStackView.alignment, .center)
        XCTAssertEqual(sut.mainStackView.spacing, 6)
    }
    
    func test_init_mainStackViewShouldHaveFourArrangedSubviews() {
        XCTAssertEqual(sut.mainStackView.arrangedSubviews.count, 4)
    }
    
    func test_init_viewShouldHaveFourSubviews() {
        XCTAssertEqual(sut.view.subviews.count, 4)
    }
    
    func test_viewDidLoad_textFieldsShouldHaveDelegate() {
        XCTAssertNotNil(sut.firstNameTextField.delegate)
        XCTAssertNotNil(sut.lastNameTextField.delegate)
        XCTAssertNotNil(sut.ageTextField.delegate)
        XCTAssertNotNil(sut.dateOfBirthTextField.delegate)
    }
    
    func test_viewDidLoad_backgroundColorShouldBeWhite() {
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
    
    func test_viewDidLoad_ageTextFieldKeyboardTypeShouldBeNumeric() {
        XCTAssertEqual(sut.ageTextField.keyboardType, .asciiCapableNumberPad)
    }
    
    func test_viewDidLoad_dateOfBirthTextFieldReturnKeyTypeShouldBeNone() {
        XCTAssertEqual(sut.dateOfBirthTextField.returnKeyType, .done)
    }
    
    func test_viewDidLoad_viewShouldHaveTapGestureRecognizer() {
        XCTAssertFalse(sut.view.gestureRecognizers?.isEmpty ?? true)
        XCTAssertTrue(sut.view.gestureRecognizers?.first is UITapGestureRecognizer)
    }
    
    func test_viewDidLoad_saveButtonShouldHaveTapGestureRecognizer() {
        XCTAssertFalse(sut.saveButton.gestureRecognizers?.isEmpty ?? true)
        XCTAssertTrue(sut.saveButton.gestureRecognizers?.first is UITapGestureRecognizer)
    }
    
    func test_viewDidLoad_logoutButtonShouldHaveTapGestureRecognizer() {
        XCTAssertFalse(sut.logoutButton.gestureRecognizers?.isEmpty ?? true)
        XCTAssertTrue(sut.logoutButton.gestureRecognizers?.first is UITapGestureRecognizer)
    }
}
