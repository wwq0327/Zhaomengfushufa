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
    static let downCellIndentifier = "DownTableViewCell"
}

struct StoryboardId {
    static let imageViewController = "ImageViewController"
    static let baikeViewController = "BaikeViewController"
    static let navDownTableViewController = "NavDownTableViewController"
    static let navBaike = "NavBaike"
}

// 创建自定义按钮
func fontButtonWith(text text: String, fontSize: CGFloat, width: CGFloat, normalImageName: String, highlightedImageName: String) -> UIButton {
//    var button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    let button = UIButton(type: UIButtonType.Custom) as UIButton
    
    button.frame = CGRectMake(0, 0, width, width)
    let font = UIFont(name: "Wyue-GutiFangsong-NC", size: fontSize) as UIFont!
    
    let textAttributes: [String: AnyObject] = [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.whiteColor()]
    
    let attributedText = NSAttributedString(string: text, attributes: textAttributes)

    button.setAttributedTitle(attributedText, forState: UIControlState.Normal)
    
    // 按钮的正常图片背景及高亮背景
    button.setBackgroundImage(UIImage(named: normalImageName), forState: UIControlState.Normal)
    button.setBackgroundImage(UIImage(named: highlightedImageName), forState: UIControlState.Highlighted)
    
    return button
}

// :MARK: Paths

struct Paths {
    static func docPath(fileName: String) -> String? {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentdirectory = paths[0] as! String
        let path = documentdirectory.stringByAppendingPathComponent(fileName)
        return path
    }
    
    static func bundlePath(fileName: String) -> String? {
        if let bundlePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "plist") {
            return bundlePath
        } else {
            return nil
        }
    }
}