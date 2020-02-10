//
//  AddUserViewController+Extension.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import RealmSwift

extension AddUserViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 250
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
        default:
            surnameTextField.becomeFirstResponder()
        }
        return true
    }
}

extension AddUserViewController {
    
    func addNewUser() {
        
        guard let name = nameTextField.text, let surname = surnameTextField.text, let age = ageTextField.text, let city = cityTextField.text, let phone = phoneTextField.text else {
            showMegaAlert("Validation Error!")
            return
        }
        
        let isvalidateName = validation.validateString(name)
        let isvalidateSurname = validation.validateString(surname)
        let isvalidateAge = validation.validateAge(Int(age) ?? 0)
        let isvalidateCity = validation.validateString(city)
        let isvalidatePhone = validation.validatePhoneNumber(phone)
        
        if isvalidateName && isvalidateSurname && isvalidateAge && isvalidateCity && isvalidatePhone {
            debugPrint("show registration")
            
        } else {
            showMegaAlert("Validation Error, Please Check All Fields!!!")
        }
    }
}



extension AddUserViewController {
    
    @objc func keyboardHide() {
        
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}
