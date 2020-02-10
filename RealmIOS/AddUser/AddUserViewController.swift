//
//  AddUserViewController.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import RealmSwift

class AddUserViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var addNewUserButtonView: UIView!
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    
//    var users: [User] = []
    
    let validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView("https://media.giphy.com/media/2yTyH3lEt6LRe/giphy.gif")
        addNewUserButtonView.blurbuttons()
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        ageTextField.delegate = self
        cityTextField.delegate = self
        phoneTextField.delegate = self
        surnameTextField.delegate = self
        
        let keyboardWiilHide = UITapGestureRecognizer(target: self, action: #selector(keyboardHide))
        view.addGestureRecognizer(keyboardWiilHide)
    }

    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapAddUserActionButton(_ sender: Any) {
        addNewUser()
    }
}
