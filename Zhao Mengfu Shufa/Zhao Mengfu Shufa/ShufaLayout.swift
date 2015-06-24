//
//  ShufaLayout.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//


import UIKit

var edgeInsets = (screenRect.width - collectionViewWidth) / 2.0

// 用以告诉collection cell 该如何进行布局的
class ShufaLayout: UICollectionViewFlowLayout {
    // 重写准备方法
    override func prepareLayout() {
        super.prepareLayout()
        let itemSize = CGSizeMake(itemWidth, itemHeight)
        self.itemSize = itemSize
        self.minimumInteritemSpacing = 0.0
        self.minimumLineSpacing = 0
        self.scrollDirection = .Horizontal
    }
    
//    // 每次 Cell 的位置发生变化的时候都会执行
//    // layoutAttributesForElementsInRect 询问 Cell 应该放在什么位置
//    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
//        // 获取所有需要显示的Cell的位置信息
//        let layoutAttributes = super.layoutAttributesForElementsInRect(rect) as! [UICollectionViewLayoutAttributes]
//        // 获取 collectionView 的滑动情况
//        let contentOffset = collectionView!.contentOffset
//        
//        for (index, attributes) in enumerate(layoutAttributes) {
//            let center = attributes.center
//            let cellPositionOnScreen = (center.x - itemWidth/2.0) - contentOffset.x
//            if cellPositionOnScreen >= (edgeInsets - itemWidth/2.0) && cellPositionOnScreen < (edgeInsets + collectionViewWidth) {
//                attributes.alpha = 0
//            } else {
//                attributes.alpha = 1
//            }
//        }
//        return layoutAttributes
//    }
//    
//    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
//        return true
//    }
}
