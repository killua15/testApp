//
//  Networking.swift
//  TestMobile App
//
//  Created by David Lopez Salinas on 1/15/21.
//
import Alamofire
import Moya
import NotificationBannerSwift

class NetworkingManager: NSObject {
    static let shared = NetworkingManager()
    let provider = MoyaProvider<NetworkingExtension>()
    
    func getLink(idLink: Int, completion: @escaping (_ error: Error?, _ success: Bool, _ hash: Comic?) -> ()) {
        provider.request(.getLink(idLink: idLink)) {
            result in
            
            switch result {
            case let .success(response):
                
                let str = String(decoding: response.data, as: UTF8.self)
                let comic = ParserFunctions.shared.getAllcomic(html: str)
                
                completion(nil, true, comic)
            case let .failure(error):
                
                HelperMenssage.shared.messageError(title: "Error", subtitle: error.errorDescription!)
                
                completion(error, false, nil)
                
            }
        }
    }
}

