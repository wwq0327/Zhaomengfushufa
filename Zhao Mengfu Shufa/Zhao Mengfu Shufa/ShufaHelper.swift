//
//  ShufaHelper.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//
import UIKit

let screenRect = UIScreen.mainScreen().bounds

// 每个列表只显示三个Cell
let itemHeight: CGFloat = 150.0 // Cell 的高度
let itemWidth: CGFloat = 44     // Cell 的宽度
let collectionViewWidth = itemWidth * 5 // 同时显示三个Cell的时候


struct CollectionCellIdentifiers {
    static let mainCellIndentifier = "MainCollectionViewCell"
}

struct StoryboardId {
    static let imageViewController = "ImageViewController"
    static let baikeViewController = "BaikeViewController"
}

// 创建自定义按钮
func fontButtonWith(#text: String, #fontSize: CGFloat, #width: CGFloat, #normalImageName: String, #highlightedImageName: String) -> UIButton {
    var button = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    
    button.frame = CGRectMake(0, 0, width, width)
    var font = UIFont(name: "Wyue-GutiFangsong-NC", size: fontSize) as UIFont!
    
    let textAttributes: [NSObject: AnyObject] = [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.whiteColor()]
    
    var attributedText = NSAttributedString(string: text, attributes: textAttributes)
    button.setAttributedTitle(attributedText, forState: UIControlState.Normal)
    
    // 按钮的正常图片背景及高亮背景
    button.setBackgroundImage(UIImage(named: normalImageName), forState: UIControlState.Normal)
    button.setBackgroundImage(UIImage(named: highlightedImageName), forState: UIControlState.Highlighted)
    
    return button
}