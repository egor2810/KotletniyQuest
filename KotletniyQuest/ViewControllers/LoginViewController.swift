//
//  ViewController.swift
//  KotletniyQuest
//
//  Created by Егор Аблогин on 31.12.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        loginButton.layer.cornerRadius = 10
    }

}

