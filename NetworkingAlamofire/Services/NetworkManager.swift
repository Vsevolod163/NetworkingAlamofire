//
//  NetworkManager.swift
//  NetworkingAlamofire
//
//  Created by Vsevolod Lashin on 14.05.2023.
//

import Foundation

enum Link {
    case coursesURL
    case postRequest
    case courseImageURL
    
    var url: URL {
        switch self {
        case .coursesURL:
            return URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses")!
        case .postRequest:
            return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        case .courseImageURL:
            return URL(string: "https://swiftbook.ru/wp-content/uploads/sites/2/2018/08/notifications-course-with-background.png")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static var shared = NetworkManager()
    
    private init() {}
    
}
