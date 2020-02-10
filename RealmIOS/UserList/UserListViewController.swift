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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView("https://media.giphy.com/media/IVhgswlzBpL3y/giphy.gif")
        
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
    }
    
}
