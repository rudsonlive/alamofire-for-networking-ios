//
//  Contas.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/21/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import ObjectMapper
class Contas: Mappable {
    
    var id: Int? = -1
    var name: String? = ""
    
    required init?(_ map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
