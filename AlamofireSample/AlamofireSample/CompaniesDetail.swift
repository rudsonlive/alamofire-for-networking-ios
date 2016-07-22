//
//  CompaniesDetail.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/21/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import ObjectMapper
class CompaniesDetail: Mappable {
    
    var url: String? = ""
    var description: String? = ""
    
    required init?(_ map: Map){
    }
    
    func mapping(map: Map) {
        url <- map[Util.KeyCompanies.url]
        description <- map[Util.KeyCompanies.description]
    }
}
