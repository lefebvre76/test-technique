//
//  ViewController.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var episodesTableView: UITableView!
    
    var episodes: [Episode] = []
    var selectedEpisode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.episodesTableView.delegate = self
        self.episodesTableView.dataSource = self

        loaderView.isHidden = false
        APIEpisode.list { response, error in
            if let episodes = response {
                self.episodes = episodes
                self.episodesTableView.reloadData()
            } else {
                self.showToast(message: "Erreur lors du chargement")
            }
            self.loaderView.isHidden = true
        }
        self.episodesTableView.separatorColor = .clear
        self.episodesTableView.register(UINib(nibName: "EpisodeTableViewCell",
                                              bundle: nil),
                                forCellReuseIdentifier: "EpisodeTableViewCell")
        self.episodesTableView.register(UINib(nibName: "BigEpisodeTableViewCell",
                                              bundle: nil),
                                forCellReuseIdentifier: "BigEpisodeTableViewCell")
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedEpisode = self.episodes[indexPath.row]
        self.performSegue(withIdentifier: "showDetails", sender: self)
        self.selectedEpisode = nil
        self.episodesTableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailViewController {
            destinationVC.episode = self.selectedEpisode
            if let index = self.episodesTableView.indexPathForSelectedRow?.row {
                destinationVC.nextEpisodes = self.episodes.after(startIndex: index + 1, limit: 4)
            }
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.episodes.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row%5 == 0 {
            return 375
        } else {
            return 110
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row%5 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BigEpisodeTableViewCell", for: indexPath) as? BigEpisodeTableViewCell else { return UITableViewCell() }
            cell.setEpisode(episode: self.episodes[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell else { return UITableViewCell() }
            cell.setEpisode(episode: self.episodes[indexPath.row])
            return cell
        }
    }
}


