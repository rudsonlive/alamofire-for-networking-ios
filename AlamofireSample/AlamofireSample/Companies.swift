//
//  Companies.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/21/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import ObjectMapper
class Companies: Mappable {
    
    var id: Int? = 0
    var name: String? = ""
    var detail: CompaniesDetail?
    
    required init?(_ map: Map){
    }
    
    func mapping(map: Map) {
        id <- map[Util.KeyCompanies.id]
        name <- map[Util.KeyCompanies.name]
        detail <- map[Util.KeyCompanies.detail]
    }
}
