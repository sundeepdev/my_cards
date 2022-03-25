//
//  BaseViewController.swift
//  cards
//
//  Created by Sundeep Singh on 20/03/22.
//

import UIKit

protocol BaseViewController {
    func setTitle(title: String)
}

extension BaseViewController where Self: UIViewController {
    func setTitle(title: String) {
        if  self.navigationController != nil {
            self.title = title
        }
    }
}
