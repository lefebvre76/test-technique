//
//  EpisodeTableViewCell.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!

    func setEpisode(episode: Episode) {
        self.episodeImageView.image = nil
        
        self.positionLabel.text = "\("season".localized().uppercased()) \(episode.season) - \("episode".localized().uppercased()) \(episode.number)"
        self.nameLabel.text = episode.name
        self.episodeImageView.load(string: episode.image.medium)
    }
}
