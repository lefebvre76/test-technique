//
//  DetailViewController.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var nextEpisodesTableView: UITableView!
    
    @IBOutlet weak var nextEpisodesTableViewHeight: NSLayoutConstraint!
    var episode: Episode?
    var nextEpisodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let episode = self.episode {
            self.imageView.load(string: episode.image.original)
            self.nameLabel.text = episode.name
            self.timeLabel.text = episode.airtime
            self.dateLabel.text = episode.airdate
            self.summaryLabel.text = episode.summary.removeHTML()
        }
        
        self.nextEpisodesTableView.delegate = self
        self.nextEpisodesTableView.dataSource = self
        self.nextEpisodesTableView.separatorColor = .clear
        self.nextEpisodesTableView.register(UINib(nibName: "EpisodeTableViewCell",
                                              bundle: nil),
                                forCellReuseIdentifier: "EpisodeTableViewCell")
        self.nextEpisodesTableViewHeight.constant = CGFloat(self.nextEpisodes.count * 110)
        self.nextEpisodesTableView.reloadData()
    }

    @IBAction func urlButtonHandle(_ sender: Any) {
        if let path = self.episode?.url, let url = URL(string:path) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            self.showToast(message: "Impossible d'ouvrir l'URL")
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.nextEpisodes.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell else { return UITableViewCell() }
        cell.setEpisode(episode: self.nextEpisodes[indexPath.row])
        return cell
    }
}
