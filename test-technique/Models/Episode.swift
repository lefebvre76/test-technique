//
//  Episode.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation

class Episode: Decodable, Identifiable {
    var id: Int
    var name: String
    var url: String
    var season: Int
    var number: Int
    var runtime: Int
    var airdate: String
    var airtime: String
    var summary: String
}
