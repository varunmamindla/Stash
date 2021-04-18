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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleUI()
        animateProgressBar(with: 0.7)
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
        achievementImage.layer.cornerRadius = 4.0
        achievementImage.contentMode = .scaleAspectFill
        achievementImage.clipsToBounds = true
        levelInfoView.layer.cornerRadius = levelInfoView.bounds.size.width/2
        levelInfoView.layer.masksToBounds = true
        guard let url = URL(string: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png") else { return }
        achievementImage.loadImageWithUrl(url)
        
        // Progress Bar
        // Do any additional setup after loading the view, typically from a nib.
        progressBar.progress = 0.0
        progressBar.layer.cornerRadius = 6
        progressBar.clipsToBounds = true
    }
    
    private func animateProgressBar(with progress: Float) {
        progressBar.progress = progress
        progressBar.setProgress(progress, animated: true)
    }
}
