//
//  ViewController.swift
//  Intercorp Test
//
//  Created by Marco Siracusano on 25/07/2021.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel: UILabel!


    init() {
        super.init(nibName: nil, bundle: nil)
        
        titleLabel = createTitleLabel("Creación de Cliente")
        
        view.addSubview(titleLabel)
        
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    private func createTitleLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        
        return label
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
}

