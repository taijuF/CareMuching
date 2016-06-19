//
//  TableViewCell.swift
//  AppByhackthon
//
//  Created by takahashi tomoki on 2016/06/19.
//  Copyright © 2016年 com.team.hackthon. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dogImage: UIImageView!
    
    @IBOutlet weak var breed: UILabel!
    
    @IBOutlet weak var sex: UILabel!
    
    @IBOutlet weak var faci: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
