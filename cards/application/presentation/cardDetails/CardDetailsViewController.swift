//
//  CardDetailsViewController.swift
//  cards
//
//  Created by Sundeep Singh on 25/03/22.
//

import Foundation
import UIKit

class CardDetailsViewController: UIViewController, BaseViewController {
    
    @IBOutlet var cardImageView: UIImageView!

    var cardDetailsVM: CardDetailsVM!

    override func viewDidLoad() {
        cardImageView.sd_setImage(with: URL(string: cardDetailsVM.imageUrlStr), completed: nil)
    }
}
