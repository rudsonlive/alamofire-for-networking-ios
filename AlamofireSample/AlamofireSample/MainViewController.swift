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
    
    var companies: [Company] = []
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAllView()
        loadCompaniesAll()
    }
    
    func configureAllView(){
        txtTitle.text = Util.Title.companies
        
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor(red: 0.135, green: 0.490, blue: 0.969, alpha: 1.000)
        refreshControl.addTarget(self, action: #selector(loadCompaniesAll), forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.addSubview(refreshControl)
    }
    
    func loadCompaniesAll(){
        
        self.refreshControl.beginRefreshing()
        Alamofire.request(.GET, Util.Url.urlCompanies, encoding: .JSON)
            .validate()
            .responseObject{ (response: Response<Companies, NSError>) in
                
                switch response.result {
                case .Success(let companies):
                    if response.result.value != nil{
                        self.companies = companies.companies!
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
        // Quando uma segue é chamada (link no storyboard)
        
        let cell = sender as! MainTableViewCell // Criando uma constante da minha custom UITableViewCell (MainTableViewCell)
        let detailView = segue.destinationViewController as! DetailViewController // Criando uma constante da minha tela DetailViewController
        
        let company = companies[cell.tag] // Obtendo o objeto do item que foi clicado
        detailView.company = company // Enviando o obj "company" para a tela DetailViewController
    }
}

