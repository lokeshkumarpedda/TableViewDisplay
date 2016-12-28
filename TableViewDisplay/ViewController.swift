//
//  ViewController.swift
//  TableViewDisplay
//
//  Created by Next on 22/12/16.
//  Copyright © 2016 Next. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    private(set) var dataArray : [[String : Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getData(){
        Services.getData(callback: { (data) -> Void in
            self.dataArray = data
            self.countriesTableView.reloadData()
        })
    }
}
//MARK:- Tableview DataSource
extension ViewController : UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if (dataArray != nil){
            return dataArray.count
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "populationCell", for: indexPath) as! CustomCell
        
        let currentValues = dataArray[indexPath.row]
        
        cell.countryName.text = currentValues["country"] as? String
        cell.population.text = currentValues["population"] as! String?
        cell.rank.text = String(describing: currentValues["rank"]!)
        
        Services.getImage(url: (currentValues["flag"] as! String?)!, callback: {
            (image) -> Void in
            cell.flagImageView.image = image
        })
        
        
        cell.contentView.backgroundColor = UIColor.lightGray
        cell.contentView.layer.cornerRadius = 8
        
        return cell
    }
    
    
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "\t\t\t\tWorld Population"
    }
    
    
}

