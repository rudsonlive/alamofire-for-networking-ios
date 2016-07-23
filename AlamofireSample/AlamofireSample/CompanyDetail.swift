//
//  CompanyDetail.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/21/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import ObjectMapper
class CompanyDetail: Mappable {
    
    var url: String? = ""
    var description: String? = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    required init?(_ map: Map){
    }
    
    func mapping(map: Map) {
        url <- map[Util.KeyCompanies.url]
        latitude <- map[Util.KeyCompanies.latitude]
        longitude <- map[Util.KeyCompanies.longitude]
        description <- map[Util.KeyCompanies.description]
    }
}
