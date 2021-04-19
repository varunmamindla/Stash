//
//  AchievementTableViewCell.swift
//  Stash
//
//  Created by Varun Mamindla on 4/18/21.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {


    @IBOutlet weak var achievementImage: ImageLoader!
    @IBOutlet weak var levelInfoView: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var completedPointsLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    class func cellIdentifier() -> String {
        return "AchievementCellIdentifier"
    }
    
    class func cellNib() -> UINib {
        return UINib(nibName: "AchievementTableViewCell", bundle: Bundle(for: AchievementTableViewCell.self))
    }
    
    private func styleUI() {
        achievementImage.layer.cornerRadius = 6.0
        achievementImage.contentMode = .scaleAspectFill
        achievementImage.clipsToBounds = true
        levelInfoView.layer.cornerRadius = levelInfoView.bounds.size.width/2
        levelInfoView.layer.masksToBounds = true
        
        // Progress Bar
        // Do any additional setup after loading the view, typically from a nib.
        progressBar.progress = 0.0
        progressBar.layer.cornerRadius = 6
        progressBar.clipsToBounds = true
        
        selectionStyle = .none
    }
    
    func animateProgressBar(with progress: Float) {
        progressBar.progress = progress
        progressBar.setProgress(progressBar.progress, animated: true)
    }
    
    func updateUI(with model: AchievementViewState) {
        levelLabel.text = model.level
        completedPointsLabel.text = model.completedPoints
        totalPointsLabel.text = model.totalPoints
        guard let url = URL(string: model.imageURL) else { return }
        achievementImage.loadImage(with: url)
    }
}
