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
        
    func addButtonPad(selector: Selector, title: String, colorBar: UIColor, tintColor: UIColor, textField: UITextField) {
        let toolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        toolBar.barStyle = .default
        let done = UIBarButtonItem(title: title, style: .done, target: self, action: selector)
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.backgroundColor = colorBar
        done.tintColor = tintColor
        let item = [flexSpace, done, flexSpace]
        toolBar.items = item
        toolBar.sizeToFit()
        textField.inputAccessoryView = toolBar
    }
    
}

