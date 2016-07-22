//
//  MainViewController.swift
//  AlamofireSample
//
//  Created by Rudson Lima on 7/21/16.
//  Copyright © 2016 Rudson Lima. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var companies: [Companies] = []
    
    var refreshControl: UIRefreshControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAllView()
        loadCompaniesAll()
    }
    
    func configureAllView(){
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadCompaniesAll), forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.addSubview(refreshControl)
    }
    
    func loadCompaniesAll(){
        
        self.refreshControl.beginRefreshing()
        Alamofire.request(.GET, Util.Url.urlCompanies, encoding: .JSON)
            .validate()
            .responseObject{ (response: Response<CompaniesMain, NSError>) in
                
                switch response.result {
                case .Success(let companiesMain):
                    if response.result.value != nil{
                        self.companies = companiesMain.companies!
                        self.tableView.reloadData()
                    }
                case .Failure(let error):
                    print(error)
                }
                
                self.refreshControl.endRefreshing()
        }
    }
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        // Defining the line number of my tableView
        return companies.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        // Remove the selection of the item clicked
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // Delete swipe
        if editingStyle == .Delete{
            companies.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        // By setting the information in the cell (list item)
        let cell = tableView.dequeueReusableCellWithIdentifier(Util.Identifier.mainTableViewCell, forIndexPath: indexPath) as! MainTableViewCell
        
        let item = companies[indexPath.row]
        cell.txtName?.text = item.name
        cell.imgIcon?.image = UIImage(named: item.name!)
        
        cell.tag = indexPath.row
        return cell
    }
    
    // UITableViewDataSource
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier)
    }
}

