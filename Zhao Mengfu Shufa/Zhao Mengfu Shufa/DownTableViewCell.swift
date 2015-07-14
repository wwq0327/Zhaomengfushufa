//
//  DownTableViewCell.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/7/7.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class DownTableViewCell: UITableViewCell {

    @IBOutlet weak var downImage: UIImageView!
    
    @IBOutlet weak var imageName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func clickDown(sender: UIButton) {
    }
}
