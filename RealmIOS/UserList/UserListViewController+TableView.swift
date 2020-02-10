//
//  UserListViewController+TableView.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit


extension UserListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as! UserInfoTableViewCell
        
        return cell
    }
    
    
    
    
}
