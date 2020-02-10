//
//  SelectViewController.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class SelectViewController: UIViewController {

    @IBOutlet weak var addToListButtonView: UIView!
    @IBOutlet weak var listButtonView: UIView!
    @IBOutlet weak var removeSelectedButtonView: UIView!
    @IBOutlet weak var removeAllButtonView: UIView!
    
    var realmService = RealService.shared
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        backgroundView("https://media.giphy.com/media/QZk0HSzvxa4KI/giphy.gif")
        
        addToListButtonView.viewLikeButton()
        listButtonView.viewLikeButton()
        removeSelectedButtonView.viewLikeButton()
        removeAllButtonView.viewLikeButton()
        
        if realmService.getUser().isEmpty {
            UserListGenerator().userList()
            users = realmService.getUser()
        } else {
            users = realmService.getUser()
        }
    }
    
    @IBAction func didTapAddActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AddUserViewController") as! AddUserViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    

    @IBAction func didTapViewListActionButton(_ sender: Any) {
        if realmService.getUser().count > 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            showMegaAlert("Sorry, No Data")
        }
    }
    @IBAction func didTapRemoveSelectedActionButton(_ sender: Any) {
        if realmService.getUser().count > 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
            viewController.allowDeleteUsers = true
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            showMegaAlert("Sorry, No Data")
        }
    }
    
    @IBAction func didTapRemoveAllActionButton(_ sender: Any) {
        if realmService.getUser().count > 0 {
            let alertController = UIAlertController(title: "Warning", message: "Delete All Data", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default) { (_) in
                self.realmService.deleteData()
            }
            let alertCancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
            alertController.addAction(alertAction)
            alertController.addAction(alertCancel)
            present(alertController, animated: true, completion: nil)
        } else {
            showMegaAlert("No Data to Delete!")
        }
    }
}


