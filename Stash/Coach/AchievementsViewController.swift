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
        
        guard let model = presenter?.achievementModel(for: indexPath.row) else { return cell }
        cell.updateUI(with: model)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AchievementsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? AchievementTableViewCell, let model = presenter?.achievementModel(for: indexPath.row) else { return }
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
            cell.animateProgressBar(with: model.progressBarFill)
            cell.alpha = model.isAccessible ? 1.0 : 0.5
        })
    }
}
