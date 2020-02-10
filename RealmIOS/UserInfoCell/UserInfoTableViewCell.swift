//
//  UserInfoTableViewCell.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var surnameTextLabel: UILabel!
    @IBOutlet weak var ageTextLabel: UILabel!
    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var phoneTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 166/244, green: 128/244, blue: 74/244, alpha: 1)
        selectedBackgroundView = view
    }
}

extension UserInfoTableViewCell {
    
    func updateUserInfo(_ user: User) {
        
        nameTextLabel.text = user.name
        surnameTextLabel.text = user.surname
        ageTextLabel.text = "\(user.age)"
        cityTextLabel.text = user.city
        phoneTextLabel.text = user.phone
    }
}
