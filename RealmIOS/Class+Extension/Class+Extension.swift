//
//  Class+Extension.swift
//  RealmIOS
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIViewController {
    
    func backgroundView(_ background: String) {
        
        let backgrounImage = UIImageView(frame: UIScreen.main.bounds)
        let backgroundView = UIView(frame: UIScreen.main.bounds)
        
        let imgUrl = URL(string: background)
        backgrounImage.kf.setImage(with: imgUrl)
        backgrounImage.contentMode = .scaleToFill
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.8
        
        view.addSubview(backgrounImage)
        view.addSubview(backgroundView)
        self.view.sendSubviewToBack(backgroundView)
        self.view.sendSubviewToBack(backgrounImage)
    }
}

extension UIView {
    
    public func viewLikeButton() {
        let view = self
       
        let blurEffect = UIBlurEffect(style: .systemChromeMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12.0
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 12.0
    }
    
     func blurbuttons() {
        let view = self
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12.0
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
                                    blurView.widthAnchor.constraint(equalTo: view.widthAnchor)])
       }
}

extension  UIViewController {
    
    func showMegaAlert(_ stringError: String) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurVisualEffectView.frame = view.bounds
        let alertController = UIAlertController(title: "Alert",message: stringError, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
        blurVisualEffectView.removeFromSuperview()
        }
        self.view.addSubview(blurVisualEffectView)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}


