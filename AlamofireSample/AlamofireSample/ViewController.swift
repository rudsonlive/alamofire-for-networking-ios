//
//  ViewController.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/21/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    
    let body = ["cpf": ""]
    let url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.POST, url, parameters: body, encoding: .JSON)
            .validate()
            .validate(contentType: ["application/json"])
            .responseObject{ (response: Response<DataCPF, NSError>) in
                
                switch response.result {
                case .Success(let dataCPF):
                    if response.result.value != nil{

                        print(dataCPF.status)
                        print(dataCPF.cpf)
                        
                        if let contas = dataCPF.contas {
                            for item in contas {
                                print(item.id)
                                print(item.name)
                            }
                        }
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
}

