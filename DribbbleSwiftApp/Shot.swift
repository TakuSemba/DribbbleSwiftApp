//
//  Shot.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/05/31.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import Foundation
import ObjectMapper

class Shot: Mappable {
    var id: Int?
    var title:String?
    var likesCount: Int?
    var commentsCount: Int?
    var description: String?
    var image: Image!
    var artist: Artist!
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        likesCount <- map["likes_count"]
        commentsCount <- map["comments_count"]
        description <- map["description"]
        image <- map["images"]
        artist <- map["user"]
    }

}
