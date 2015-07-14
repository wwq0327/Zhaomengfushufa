//
//  MainCollectionViewCell.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    var textLabel: FontLabel!
    var labelText: String = "" {
        didSet {
            self.textLabel.updateText(labelText)
            self.textLabel.center = CGPointMake(itemWidth/2.0, self.textLabel.center.y + 28)
        }
    }
    
    var textInt: Int = 0
    
    override func awakeFromNib() {
        let lineHeight: CGFloat = 5.0
        self.textLabel = FontLabel(fontname: "Wyue-GutiFangsong-NC", labelText: labelText, fontSize: 18.0, lineHeight: lineHeight)
        
        self.addSubview(textLabel)
    }
}
