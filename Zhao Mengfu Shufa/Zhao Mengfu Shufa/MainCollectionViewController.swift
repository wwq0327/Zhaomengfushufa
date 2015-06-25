//
//  MainCollectionViewController.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    var headerLabel: UILabel!
    
    let shufalists = [
        ["name": "归去来辞",    "filename": "xianjufu.jpg"],
        ["name": "兰亭序", "filename": "兰亭序.jpg"],
        ["name": "闲居赋",    "filename": "xianjufu.jpg"],
        ["name": "兰亭序", "filename": "兰亭序.jpg"],
        ["name": "归去来辞",    "filename": "xianjufu.jpg"],
        ["name": "兰亭序", "filename": "兰亭序.jpg"],
        ["name": "归去来辞",    "filename": "xianjufu.jpg"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
//        self.navigationController?.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        
        // 设置标题头
        headerLabel = FontLabel(fontname: "TpldKhangXiDictTrial", labelText: "赵孟頫书法集", fontSize: 24.0, lineHeight: 5.0)
        headerLabel.center = CGPointMake((screenRect.width - headerLabel.frame.size.width)/2.0+12, 50+headerLabel.frame.size.height/2.0)
        self.view.addSubview(headerLabel)
//        headerLabel.userInteractionEnabled = true
        
        
        // 设置 Cell 的layout
        var mainLayout = ShufaLayout()
        mainLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        self.collectionView?.setCollectionViewLayout(mainLayout, animated: false)
        
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: collectionViewWidth, height: itemHeight)
        self.collectionView?.center = CGPoint(x: self.view.frame.size.width/2.0, y: self.view.frame.size.height/2.0)
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewWillLayoutSubviews() {
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: collectionViewWidth, height: itemHeight)
        self.collectionView?.center = CGPoint(x: self.view.frame.size.width/2.0, y: self.view.frame.size.height/2.0)
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return shufalists.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionCellIdentifiers.mainCellIndentifier, forIndexPath: indexPath) as! MainCollectionViewCell
        
        // Configure the cell
        let name = shufalists[indexPath.row]["name"]
        cell.labelText = name!
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        var leftRightMagrin = (collectionViewWidth - itemWidth)/2
//        return UIEdgeInsetsMake(0, leftRightMagrin, 0, leftRightMagrin);
//    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let dvc = self.storyboard?.instantiateViewControllerWithIdentifier(StoryboardId.imageViewController) as! ImageViewController
        var filename = shufalists[indexPath.row]["filename"]!
        
        dvc.imageName = filename
        self.navigationController?.pushViewController(dvc, animated: true)
    }

}
