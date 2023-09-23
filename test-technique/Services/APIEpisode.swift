//
//  APIEpisodes.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation
import Alamofire

class APIEpisode {

    static func list(completion: @escaping ([Episode]?, Error?) -> Void) {
        AF.request("https://beta-2.goandup.paris/got.json")
        .responseDecodable(of: TvShowResult.self) { response in
            switch response.result {
            case .success(let data):
                completion(data.embedded.episodes, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

struct TvShowResult: Decodable {
    let embedded: Embedded

    private enum CodingKeys : String, CodingKey {
        case embedded = "_embedded"
    }
}

struct Embedded: Decodable {
    let episodes: [Episode]
}
