//
//  NetworkingExtension.swift
//  TestMobile App
//
//  Created by David Lopez Salinas on 1/15/21.
//

import Foundation
import Moya

// MARK: - Routes
enum NetworkingExtension {
    case getLink(idLink: Int)
}
// MARK: - TargetType
extension NetworkingExtension: TargetType {
    
    var headers: [String : String]? {
        return  ["Content-type": "application/json"]
    }
    
    var baseURL: URL {
        return URL(string: "https://xkcd.com/")!
    }
    var path: String {
        switch self {
        //Auth
        case let .getLink(idLink):
            return "\(idLink)"
        }
    }
    var method:  Moya.Method {
        switch self {
        case .getLink:
            return .get
        }
    }
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .getLink(idLink):
            return .requestPlain
        }
    }
}

