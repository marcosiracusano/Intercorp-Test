//
//  LoginViewController.swift
//  Intercorp Test
//
//  Created by Marco Siracusano on 25/07/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginButton: UIButton!

    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        loginButton = createButton()

        view.addSubview(loginButton)
        
        setLoginButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    private func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Iniciar sesión", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        button.addGestureRecognizer(tap)
        
        return button
    }
    
    @objc func handleTap() {
        navigationController?.pushViewController(FormViewController(), animated: true)
    }
    
    private func setLoginButtonConstraints() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
