//
//  RealmService.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import RealmSwift

class RealService {
    
    static let shared: RealService = {
       
        let instance = RealService()
        return instance
    }()
    
    func writeUSer(_ user : [User]) {
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(user)
            }
        } catch {
            debugPrint("error write user info")
        }
    }
    
    func getUser() -> [User] {
        
        do {
            let realm = try Realm()
            let user = realm.objects(User.self)
            let userList = Array(user)
            return userList
        } catch  {
            debugPrint("error get user")
        }
        return []
    }

    func deleteData() {
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            debugPrint("error deleting data")
        }
    }
   
    func removeUsers(_ users: [User]) {
        
        do {
            let realm = try Realm()
            try realm.write {
                let deleteArray = List<User>()
                 let deleteUsers = users.filter( { $0.isDelete == true})
                    deleteArray.append(objectsIn: deleteUsers)
                realm.delete(deleteArray)
            }
        } catch {
            debugPrint(error)
        }
    }
}

