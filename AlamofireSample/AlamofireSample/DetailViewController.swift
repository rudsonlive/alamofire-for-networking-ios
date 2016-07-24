//
//  DetailViewController.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/22/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var company: Company!
    
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var imgicon: UIImageView!
    @IBOutlet weak var txtDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewAll()        
    }
    
    
    func configureViewAll(){
        
        txtName.text = company.name
        txtTitle.text = Util.Title.detail
        imgicon.image = UIImage(named: company.name!)

        txtDescription.text = company.detail?.description!
        txtDescription.textColor = UIColor(white: 0.498, alpha: 1.000)
        txtDescription.font = UIFont.init(name: Util.FontName.helveticaNeue, size: 17)
    }

    @IBAction func onActionClick(sender: UIButton) {
        switch sender.tag {
        case 0: // back
            self.navigationController?.popViewControllerAnimated(true)
        case 1: // Open map
            let mapViewController = self.storyboard?.instantiateViewControllerWithIdentifier(Util.Identifier.mapViewController) as! MapViewController
            mapViewController.company = company
            self.navigationController?.pushViewController(mapViewController, animated: true)

        case 2: // Open site
            let webSiteViewController = self.storyboard?.instantiateViewControllerWithIdentifier(Util.Identifier.webSiteViewController) as! WebSiteViewController
            webSiteViewController.company = company
            self.navigationController?.pushViewController(webSiteViewController, animated: true)

        default: break
        }
    }
}
