//
//  RealmModel.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var city: String = ""
    @objc dynamic var phone: String = ""
    
    var isDelete: Bool?
}
