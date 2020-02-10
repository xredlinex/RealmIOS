//
//  AddUserViewController+TextField.swift
//  RealmIOS
//
//  Created by alexey sorochan on 10.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension AddUserViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 310
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            surnameTextField.becomeFirstResponder()
        case surnameTextField:
            ageTextField.becomeFirstResponder()
        case ageTextField:
            cityTextField.becomeFirstResponder()
        case cityTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            phoneTextField.resignFirstResponder()
            bottomHeightConstraint.constant = 0
        default:
            surnameTextField.becomeFirstResponder()
        }
        return true
    }
}

extension AddUserViewController {
    
    @objc func keyboardHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}

extension AddUserViewController {
    
    @objc func addNextButtonActionAge() {
        cityTextField.becomeFirstResponder()
    }
    
    @objc func addDoneButtonActionPhone() {
        phoneTextField.resignFirstResponder()
        bottomHeightConstraint.constant = 0
    }
}

extension AddUserViewController {
    
    func addNextButtonNumberPad() {
        let nextToolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        nextToolBar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let next = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(addNextButtonActionAge))
        let item = [flexSpace, next]
        nextToolBar.backgroundColor = .red
        next.tintColor = .white
        nextToolBar.items = item
        nextToolBar.sizeToFit()
        ageTextField.inputAccessoryView = nextToolBar
    }
    
    func addDoneButtonPhonePad() {
        let doneToolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        doneToolBar.barStyle = .default
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addDoneButtonActionPhone))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        doneToolBar.backgroundColor = .red
        done.tintColor = .white
        let item = [flexSpace, done, flexSpace]
        doneToolBar.items = item
        doneToolBar.sizeToFit()
        phoneTextField.inputAccessoryView = doneToolBar
    }
}

