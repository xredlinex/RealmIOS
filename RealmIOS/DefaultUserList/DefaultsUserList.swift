//
//  DefaultsUserList.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class UserListGenerator {
    
    func userList() {
        
        let realmServise = RealService.shared
        
        let userOne = User()
        userOne.name = "Rick"
        userOne.surname = "Deckard"
        userOne.age = 37
        userOne.city = "Los Angeles"
        userOne.phone = "213-200-2201"
        
        let userTwo = User()
        userTwo.name = "Rachael"
        userTwo.surname = "Tyrell"
        userTwo.age = 30
        userTwo.city = "Los Angeles"
        userTwo.phone = "213-209-3705"
        
        let userThree = User()
        userThree.name = "Roy"
        userThree.surname = "Batty"
        userThree.age = 40
        userThree.city = ""
        userThree.phone = "213-213-8656"
        
        let userFour = User()
        userFour.name = "Harry"
        userFour.surname = "Bryant"
        userFour.age = 33
        userFour.city = "Los Angeles"
        userFour.phone = "213-249-3314"
        
        let userFive = User()
        userFive.name = "Leon"
        userFive.surname = "Kowalski"
        userFive.age = 38
        userFive.city = "Los Angeles"
        userFive.phone = "213-253-9892"
        
        let userSix = User()
        userSix.name = "Pris"
        userSix.surname = "Stratton"
        userSix.age = 30
        userSix.city = "Los Angeles"
        userSix.phone = "213-256-6026"
        
        realmServise.writeUSer([userOne, userTwo, userThree, userFour, userFive])
    }
}
