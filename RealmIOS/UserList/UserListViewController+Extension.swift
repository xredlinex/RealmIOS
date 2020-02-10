//
//  UserListViewController+Extension.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension UserListViewController {
    
    func deleteUsers() {
        
        let alertController = UIAlertController(title: "Warining", message: "Delete Selected Users?", preferredStyle: .alert)
        let aletAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.realmService.removeUsers(self.users)
            self.users = self.realmService.getUser()
            self.tableView.reloadData()
            if self.users.count == 0 {
                self.navigationController?.popViewController(animated: false)
            }
        }
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addAction(aletAction)
        alertController.addAction(alertCancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension UserListViewController {
    
    func countSelected() {
        
        if let select = tableView.indexPathForSelectedRow  {
            if select.count > 0 {
                deleteButtonView.isHidden = false
                 titleTextLabel.text = "DELETE USERS"
                 titleTextLabel.textColor = .red
            }
        } else {
            deleteButtonView.isHidden = true
            titleTextLabel.text = ""
            titleTextLabel.textColor = .red
        }
    }
}

extension UserListViewController {
    
    func ifDeleteUsers() {
        
        if !allowDeleteUsers {
            deleteButtonView.isHidden = true
            titleTextLabel.text = "User List"
            titleTextLabel.textColor = .white
        } else {
            
            deleteButtonView.isHidden = true
            tableView.allowsMultipleSelection = true
        }
    }
}
