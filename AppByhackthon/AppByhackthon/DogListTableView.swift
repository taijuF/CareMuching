//
//  DogListTableView.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/19.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit
import CoreData

class DogListTableView: UITableViewController {

    var ListTable = UITableView()
    var fav = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListTable.frame = self.view.bounds
        
        self.view.addSubview(ListTable)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        
        //var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        return cell
    }
    
    
}
