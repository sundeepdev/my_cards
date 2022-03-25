//
//  CardListTableViewCell.swift
//  cards
//
//  Created by Sundeep Singh on 20/03/22.
//

import UIKit
import SDWebImage

class CardListTableViewCell: UITableViewCell {
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var cardNameLabel: UILabel!

    var cardListCellVM: CardListTableViewCellVM!

    func bind(cardListCellVM: CardListTableViewCellVM) {
        self.cardListCellVM = cardListCellVM
        cardImageView.sd_setImage(with: URL(string: cardListCellVM.imageUrlStr ?? ""), completed: nil)
        cardNameLabel.text = cardListCellVM.cardName
    }
}
