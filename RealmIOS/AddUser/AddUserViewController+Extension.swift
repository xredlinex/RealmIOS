//
//  AddUserViewController+Extension.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import RealmSwift



extension AddUserViewController {
    
    func addNewUser() {
        
        guard let name = nameTextField.text, let surname = surnameTextField.text, let age = ageTextField.text, let city = cityTextField.text, let phone = phoneTextField.text else {
            return
        }
        
        let isvalidateName = validation.validateString(name)
        let isvalidateSurname = validation.validateString(surname)
        let isvalidateAge = validation.validateAge(Int(age) ?? 0)
        let isvalidateCity = validation.validateString(city)
        let isvalidatePhone = validation.validatePhoneNumber(phone)
        
        if isvalidateName && isvalidateSurname && isvalidateAge && isvalidateCity && isvalidatePhone {
            let newUser = User()
            newUser.name = name
            newUser.surname = surname
            newUser.age = Int(age) ?? 0
            newUser.city = city
            newUser.phone = phone
            
            realmService.writeUSer([newUser])
            
    
            
        } else {
            var validateText = ""
            
            if !isvalidateName {
                validateText = validateText + ", Check Name Field"
            }
            if !isvalidateSurname {
                 validateText = validateText + ", Check Surname Field"
            }
            if !isvalidateAge {
                 validateText = validateText + ", Wrong Age"
            }
            if !isvalidateCity {
                 validateText = validateText + ", Chek City Field"
            }
            if !isvalidatePhone {
                 validateText = validateText + ", Wrong Number"
            }

            showMegaAlert("Validation Error" + "\(validateText)" + "!")
        }
    }
}

extension AddUserViewController {
    
    func registrationAlert() {
        
        let alertController = UIAlertController(title: "Succes!", message: "Registration Complere", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.navigationController?.popViewController(animated: false)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
    
