//
//  Companies.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/21/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import ObjectMapper
class Companies: Mappable {

    var companies: [Company]?
    
    required init?(_ map: Map){
    }
    
    func mapping(map: Map) {
        companies <- map[Util.KeyCompanies.companies]
    }
}
