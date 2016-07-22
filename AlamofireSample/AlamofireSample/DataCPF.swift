//
//  DataCPF.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/21/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import ObjectMapper
class DataCPF: Mappable {
    
    var status: Int? = -1
    var cpf: String? = ""
    var contas: [Contas]?
    
    required init?(_ map: Map){
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        cpf <- map["cpf"]
        contas <- map["contas"]
    }
}
