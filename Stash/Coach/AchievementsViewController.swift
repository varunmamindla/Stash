//
//  AchievementsViewController.swift
//  Stash
//
//  Created by Varun Mamindla on 4/18/21.
//

import UIKit

protocol AchievementsViewing: AnyObject {
    func showIndicator()
    func hideIndicatior()
    func updateView()
}

final class AchievementsViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var achievementsTableView: UITableView!
    
    var presenter: AchievementsPresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Loading..."
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
    
    private func setupTableView() {
        achievementsTableView.delegate = self
        achievementsTableView.dataSource = self
        achievementsTableView.tableFooterView = UIView()
        achievementsTableView.estimatedRowHeight = 100.0
        achievementsTableView.rowHeight = UITableView.automaticDimension
        achievementsTableView.separatorStyle = .none
        
        achievementsTableView.register(AchievementTableViewCell.cellNib(), forCellReuseIdentifier: AchievementTableViewCell.cellIdentifier())
    }
}

extension AchievementsViewController: AchievementsViewing {
    func showIndicator() {
        loadingIndicator.startAnimating()
    }
    
    func hideIndicatior() {
        loadingIndicator.stopAnimating()
    }
    
    func updateView() {
        title = presenter?.title
    }
}

// MARK: - UITableViewDataSource

extension AchievementsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.noOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AchievementTableViewCell.cellIdentifier(), for: indexPath) as? AchievementTableViewCell else { return UITableViewCell(frame: CGRect.zero) }
        
        /*guard let model = rewardsCardModel else { return cell }
        let cardsCount = rewardsCardModel?.rewardCards.count ?? 0
        
        cell.cardExpirationLabel.text = model.expirationDateString(forCardAt: indexPath.row)
        cell.cardAmountLabel.text = model.cardAmount(forCardAt: indexPath.row)
        cell.starMoneyLabel.text = CardViewConstants.starMoneyTitle
        cell.separatorView.isHidden = indexPath.row == cardsCount - 1 ? true : false*/
        
        return cell

    }
}

// MARK: - UITableViewDelegate

extension AchievementsViewController: UITableViewDelegate {}
