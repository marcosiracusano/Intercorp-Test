//
//  ViewController.swift
//  Intercorp Test
//
//  Created by Marco Siracusano on 25/07/2021.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel: UILabel!
    var firstNameTextField: UITextField!
    var lastNameTextField: UITextField!
    var ageTextField: UITextField!
    var dateOfBirthTextField: UITextField!
    var button: UIButton!
    var mainStackView: UIStackView!

    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        titleLabel = createTitleLabel("Creación de Cliente")
        
        firstNameTextField = createTextField(placeholder: "Nombre")
        lastNameTextField = createTextField(placeholder: "Apellido")
        ageTextField = createTextField(placeholder: "Edad")
        dateOfBirthTextField = createTextField(placeholder: "Fecha de nacimiento")
        
        button = createButton()
        
        mainStackView = createStackView(axis: .vertical, distribution: .fillEqually, alignment: .center)
        
        mainStackView.addArrangedSubview(firstNameTextField)
        mainStackView.addArrangedSubview(lastNameTextField)
        mainStackView.addArrangedSubview(ageTextField)
        mainStackView.addArrangedSubview(dateOfBirthTextField)
        mainStackView.addArrangedSubview(button)
        
        view.addSubview(titleLabel)
        view.addSubview(mainStackView)
        
        setTitleLabelConstraints()
        setTextFieldConstraint(firstNameTextField)
        setTextFieldConstraint(lastNameTextField)
        setTextFieldConstraint(ageTextField)
        setTextFieldConstraint(dateOfBirthTextField)
        setStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    // MARK: - Creational methods
    
    private func createTitleLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        
        return label
    }
    
    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
                
        return textField
    }
    
    private func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Guardar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        
        return button
    }
    
    private func createStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = 6
        
        return stackView
    }
    
    // MARK: - Constraint setup methods
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    private func setStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        mainStackView.heightAnchor.constraint(equalToConstant: 202).isActive = true
    }

    private func setTextFieldConstraint(_ textField: UITextField) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
    }
}

