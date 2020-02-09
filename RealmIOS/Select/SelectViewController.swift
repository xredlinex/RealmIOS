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
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        backgroundView("https://media.giphy.com/media/QZk0HSzvxa4KI/giphy.gif")
        addToListButtonView.viewLikeButton()
        listButtonView.viewLikeButton()
        removeSelectedButtonView.viewLikeButton()
        removeAllButtonView.viewLikeButton()
        
 
    }
    


}


extension SelectViewController {
    


}


