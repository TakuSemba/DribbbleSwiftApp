//
//  Image.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/05/31.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import Foundation
import ObjectMapper

class Image: Mappable {
    var hidpi: String?
    var normal: String?
    var teaser: String?
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        hidpi <- map["hidpi"]
        normal <- map["normal"]
        teaser <- map["teaser"]
    }
}