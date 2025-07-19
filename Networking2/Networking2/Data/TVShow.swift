import Foundation

struct TVShowsResponse: Decodable {
    let results: [TVShow]
}

struct TVShow: Decodable {
    let name: String?
    let posterPath: String?
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}



enum TVError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError
    case unknown
}
