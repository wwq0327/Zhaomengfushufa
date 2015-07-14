//
//  FontLabel.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class FontLabel: UILabel {

    var textAttributes: [String : AnyObject]!
    
    convenience init(fontname:String ,labelText:String, fontSize : CGFloat, lineHeight: CGFloat){
        // 调用UIView的构造器
        self.init(frame: CGRectZero)
        
        let font = UIFont(name: fontname, size: fontSize) as UIFont!
        
        // 设置段落样式，行高
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        
        textAttributes = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle]
        
        let labelSize = sizeHeightWithText(labelText, fontSize: fontSize ,textAttributes: textAttributes)
        
        self.frame = CGRectMake(0, 0, labelSize.width, labelSize.height)
        
        self.attributedText = NSAttributedString(string: labelText, attributes: textAttributes)
        self.lineBreakMode = NSLineBreakMode.ByCharWrapping
        self.numberOfLines = 0
    }
    
    func resizeLabelWithFontName(fontname:String, labelText:String, fontSize : CGFloat, lineHeight: CGFloat ){
        let font = UIFont(name: fontname, size: fontSize) as UIFont!
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        
        textAttributes = [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.blackColor(),  NSParagraphStyleAttributeName: paragraphStyle]
        let labelSize = sizeHeightWithText(labelText, fontSize: fontSize ,textAttributes: textAttributes)
        
        self.frame = CGRectMake(0, 0, labelSize.width, labelSize.height)
        
        self.attributedText = NSAttributedString(string: labelText, attributes: textAttributes)
        // 换行
        self.lineBreakMode = NSLineBreakMode.ByCharWrapping
        // label多行显示
        self.numberOfLines = 0
    }
    
    func updateText(labelText: String) {
        
        let labelSize = sizeHeightWithText(labelText, fontSize: self.font.pointSize ,textAttributes: textAttributes)
        self.frame = CGRectMake(0, 0, labelSize.width, labelSize.height)
        self.attributedText = NSAttributedString(string: labelText, attributes: textAttributes)
    }
    
    func updateLabelColor(color: UIColor) {
        textAttributes[NSForegroundColorAttributeName] = color
        self.attributedText = NSAttributedString(string: self.attributedText!.string, attributes: textAttributes)
    }
    
}

// 计算竖式文字的大小
func sizeHeightWithText(labelText: NSString, fontSize: CGFloat, textAttributes: [String : AnyObject]) -> CGRect {
    // 一个文字的宽度， 480高度的文本框
    // textAttributes 存放字体及行高宽之类的信息
    return labelText.boundingRectWithSize(CGSizeMake(fontSize, 480), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textAttributes, context: nil)
}