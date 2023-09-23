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
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = dequeueCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let row = indexPath.row
        cell.textLabel?.text = episodes[row].name
        return cell
    }
}


