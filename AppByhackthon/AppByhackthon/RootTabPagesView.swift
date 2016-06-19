//
//  RootTabPagesView.swift
//  AppByhackthon
//
//  Created by kazutaka on 2016/06/19.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit
import TabPageViewController

class RootTabPagesView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        let tc = TabPageViewController.create()
        
        
        let vc1 = ViewController()
        //vc1.view.backgroundColor = UIColor.whiteColor()
        let vc2 = DogListTableView()
        vc2.view.backgroundColor = UIColor.redColor()

        tc.tabItems = [(vc1, "First"), (vc2, "Second")]
        var option = TabPageOption()
        option.tabWidth = view.frame.width / CGFloat(tc.tabItems.count)
        tc.option = option
        navigationController?.pushViewController(tc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}

