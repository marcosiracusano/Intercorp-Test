//
//  FormViewController.swift
//  Intercorp Test
//
//  Created by Marco Siracusano on 25/07/2021.
//

import UIKit
import FirebaseDatabaseUI

class FormViewController: UIViewController {

    var titleLabel: UILabel!
    
    var firstNameTextField: UITextField!
    var lastNameTextField: UITextField!
    var ageTextField: UITextField!
    var dateOfBirthTextField: UITextField!

    var datePicker: UIDatePicker!
    
    var mainStackView: UIStackView!
    
    var saveButton: UIButton!
    var popupMessage: String = "Cliente guardado"

    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        titleLabel = createLabel("Creación de Cliente", .boldSystemFont(ofSize: 25), .black)
        
        firstNameTextField = createTextField(placeholder: "Nombre")
        lastNameTextField = createTextField(placeholder: "Apellido")
        ageTextField = createTextField(placeholder: "Edad")
        dateOfBirthTextField = createTextField(placeholder: "Fecha de nacimiento")
        
        datePicker = createDatePicker()
        dateOfBirthTextField.inputView = datePicker
        
        saveButton = createButton("Guardar")
        
        mainStackView = createStackView(axis: .vertical, distribution: .fillEqually, alignment: .center)
        
        mainStackView.addArrangedSubview(firstNameTextField)
        mainStackView.addArrangedSubview(lastNameTextField)
        mainStackView.addArrangedSubview(ageTextField)
        mainStackView.addArrangedSubview(dateOfBirthTextField)
        
        view.addSubview(titleLabel)
        view.addSubview(mainStackView)
        view.addSubview(saveButton)
        
        setTitleLabelConstraints()
        setTextFieldConstraint(firstNameTextField)
        setTextFieldConstraint(lastNameTextField)
        setTextFieldConstraint(ageTextField)
        setTextFieldConstraint(dateOfBirthTextField)
        setMainStackViewConstraints()
        setSaveButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        ageTextField.delegate = self
        dateOfBirthTextField.delegate = self
        
        setupView()
    }
    
    
    // MARK: - Creational methods
    
    private func createLabel(_ text: String,_ font: UIFont,_ color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        
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
        
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .allEditingEvents)
        
        return textField
    }
    
    private func createDatePicker() -> UIDatePicker {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        
        picker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
        
        return picker
    }
    
    private func createButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.isEnabled = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        button.addGestureRecognizer(tap)
        
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
    
    private func setTextFieldConstraint(_ textField: UITextField) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
    }
    
    private func setMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        mainStackView.heightAnchor.constraint(equalToConstant: 202).isActive = true
    }

    private func setSaveButtonConstraints() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 30).isActive = true
    }
    
    // MARK: - Other methods
    
    private func setupView() {
        view.backgroundColor = .white
        
        ageTextField.keyboardType = .asciiCapableNumberPad
        dateOfBirthTextField.returnKeyType = .done
        
        let saveButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let dismissKeyboardTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        view.addGestureRecognizer(saveButtonTapGesture)
        view.addGestureRecognizer(dismissKeyboardTapGesture)
    }
    
    @objc private func dateChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        dateOfBirthTextField.text = "\(dateFormatter.string(from: datePicker.date))"
        textFieldDidChange()
    }
    
    @objc private func textFieldDidChange() {
        var contentIsValid = true
        
        let textFields: [UITextField] = [firstNameTextField, lastNameTextField, ageTextField, dateOfBirthTextField]
        
        for textField in textFields {
            if !textField.hasText {
                contentIsValid = false
                break
            }
        }
        
        saveButton.isEnabled = contentIsValid
    }
    
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        dateOfBirthTextField.resignFirstResponder()
    }
    
    @objc func handleTap() {
        let newClient = Client(firstName: firstNameTextField.text,
                               lastName: lastNameTextField.text,
                               age: ageTextField.text,
                               dateOfBirth: dateOfBirthTextField.text)
        
        saveClient(newClient)
    }
    
    private func saveClient(_ client: Client) {
        let databaseReference = Database.database().reference()
        databaseReference.child("client").setValue(["first_name": client.firstName,
                                                    "last_name": client.lastName,
                                                    "age": client.age,
                                                    "date_of_birth": client.dateOfBirth])
        clientSavedPopup(popupMessage)
        
        saveButton.setTitle("Sobreescribir", for: .normal)
        popupMessage = "Cliente sobreescrito"
    }
    
    private func clientSavedPopup(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        self.present(alert, animated: true, completion: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - UITextFieldDelegate

extension FormViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case firstNameTextField:
                lastNameTextField.becomeFirstResponder()
            case lastNameTextField:
                ageTextField.becomeFirstResponder()
            case ageTextField:
                dateOfBirthTextField.becomeFirstResponder()
            default:
                dateOfBirthTextField.resignFirstResponder()
            }

            return true
    }
}
