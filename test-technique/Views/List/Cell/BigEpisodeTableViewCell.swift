//
//  EpisodeTableViewCell.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation

import UIKit

class BigEpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    func setEpisode(episode: Episode) {
        self.descriptionView.clipsToBounds = true
        self.descriptionView.layer.cornerRadius = 6
        self.descriptionView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.bottomView.layer.cornerRadius = 6
                                        
        self.episodeImageView.image = nil
        self.positionLabel.text = "\("season".localized().uppercased()) \(episode.season) - \("episode".localized().uppercased()) \(episode.number)"
        self.nameLabel.text = episode.name
        self.summaryLabel.text = episode.summary.removeHTML()
        self.episodeImageView.load(string: episode.image.original)
    }
}
