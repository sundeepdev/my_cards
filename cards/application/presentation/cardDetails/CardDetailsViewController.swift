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
    @IBOutlet var cardNameLabel: UILabel!
    @IBOutlet var cardNumberLabel: UILabel!
    @IBOutlet var cardEnabledLabel: UILabel!

    var cardDetailsVM: CardDetailsVM!

    override func viewDidLoad() {
        cardImageView.sd_setImage(with: URL(string: cardDetailsVM.imageUrlStr), completed: nil)
        cardNameLabel.text = cardDetailsVM.title
        cardNumberLabel.text = cardDetailsVM.cardNumber
        cardEnabledLabel.text = String(cardDetailsVM.cardEnabled)
    }
}
