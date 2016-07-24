//
//  Util.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/22/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import Foundation
class Util{

    struct Url {
         static let urlCompanies = "https://raw.githubusercontent.com/rudsonlive/alamofire-for-networking-ios/master/companies.json"
    }
    
    struct KeyCompanies {
        static let id = "id"
        static let url = "url"
        static let name = "name"
        static let detail = "detail"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let companies = "companies"
        static let description = "description"
    }
    
    struct Title {
        static let detail = "Detalhe"
        static let companies = "Companies"
    }
    
    struct Identifier {
        static let mainTableViewCell = "Cell"
        static let mapViewController = "MapViewController"
        static let webSiteViewController = "WebSiteViewController"
    }
    
    struct BarButtonItemTitle {
        static let map = "Map"
    }
    
    struct FontName {
        static let helveticaNeue = "Helvetica Neue"
    }
}
