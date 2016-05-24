//
//  Artist.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/05/31.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import Foundation
import ObjectMapper

class Artist: Mappable {
    
    var id: Int?
    var name: String?
    var avatorUrl: String?
    var location: String?
    var followersCount: Int?
    var followingsCount: Int?
    var commentsReceivedCount: Int?
    var likesReceivedCount: Int?
    var shotsCount: Int?
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["username"]
        avatorUrl <- map["avatar_url"]
        location <- map["location"]
        followersCount <- map["followers_count"]
        followingsCount <- map["followings_count"]
        commentsReceivedCount <- map["comments_received_count"]
        likesReceivedCount <- map["likes_received_count"]
        shotsCount <- map["shots_count"]
    }
}