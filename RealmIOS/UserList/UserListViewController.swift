//
//  UserListViewController.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let realmService = RealService.shared
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView("https://media.giphy.com/media/IVhgswlzBpL3y/giphy.gif")
        
        if realmService.getUser().isEmpty {
            UserListGenerator().userList()
            users = realmService.getUser()
        } else {
            users = realmService.getUser()
        }
        tableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInfoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
}
