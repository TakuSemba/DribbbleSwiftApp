//
//  HttpClient.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/06/01.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import RxSwift
import Alamofire
import Foundation
import ObjectMapper

class ShotApi {
    
    static let ACCESS_TOKEN: String = "9a41e101508074ad21b5dee2b64ea32a38d8a9ec9318306dd912edb717a3a739"
    static let limit = "24"
    static let BASE_URL: String = "https://api.dribbble.com/v1/shots/"
        
    static func getShots(page: Int, category: Category) -> Observable<[Shot]> {
        let params: [String: String] = ["access_token": ACCESS_TOKEN, "page": String(page), "list": category.rawValue, "per_page": limit]
        return Observable.create { observer -> Disposable in
            Alamofire.request(.GET, BASE_URL, parameters: params)
                .responseJSON { response in
                    switch response.result {
                    case .Success(let result):
                        var shots: [Shot] = []
                        for i in 0 ..< result.count {
                            let shot = Mapper<Shot>().map(result[i])
                            shots.append(shot!)
                        }
                        observer.on(.Next(shots))
                        observer.on(.Completed)
                    case .Failure(let error):
                        observer.on(.Error(error))
                    }
            }
            return AnonymousDisposable {}
            }
    }
    
    enum Category: String {
        case ANIMATED = "animated"
        case ATTACHMENTS = "attachments"
        case DEBUTS = "debuts"
        case PLAYOFFS = "playoffs"
        case REBOUNDS = "rebounds"
        case TEAMS = "teams"
        
        static let allValues = [ANIMATED, ATTACHMENTS, DEBUTS, PLAYOFFS, REBOUNDS, TEAMS]
    }
}