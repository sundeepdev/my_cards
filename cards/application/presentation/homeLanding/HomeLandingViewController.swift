//
//  ViewController.swift
//  cards
//
//  Created by Sundeep Singh on 18/03/22.
//

import UIKit
import RxSwift
import RxCocoa
import NVActivityIndicatorView

class HomeLandingViewController: UIViewController, BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    var selectedCard: Card?

    var homeLandingVM: HomeLandingVM = HomeLandingVM(fetchCardsUseCase:
                                                        DefaultFetchCardsListUseCase(
                                                            cardsRepository: DefaultCardsRepository()))
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeLandingVM.cards.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                            withIdentifier: "CardListTableViewCell")
                            as? CardListTableViewCell
                            else {
                                return UITableViewCell()
                            }

        cell.bind(cardListCellVM: CardListTableViewCellVM(card: homeLandingVM.cards.value[indexPath.row]))
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        self.setTitle(title: "Home")
        startAnimation()
        homeLandingVM.viewDidLoad()
        self.bind(to: homeLandingVM)
    }

    private func setupUI() {

    }

    private func bind(to viewModel: HomeLandingVM) {
        _ = viewModel.cards.subscribe(onNext: {[weak self] _ in
            self?.updateItems()
            if !viewModel.cards.value.isEmpty {
                self?.stopAnimation()
            }
        }, onError: { [weak self]error in
            self?.stopAnimation()
            print(error)
            self?.updateItems()
        })
    }

    private func updateItems() {
        tableView.reloadData()
    }

    private func startAnimation() {
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = false
    }

    private func stopAnimation() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCard = homeLandingVM.cards.value[indexPath.row]
        performSegue(withIdentifier: "showCardDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if "showCardDetails" == segue.identifier {
            if let targetVC = segue.destination as? CardDetailsViewController,
                let selectedCard = self.selectedCard {
                targetVC.cardDetailsVM = CardDetailsVM(card: selectedCard)
            }
        }
    }

}
