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
    
    var shufaLists: NSArray!
    
//    let shufalists = [
//        ["name": "归去来辞",    "filename": "xianjufu.jpg"],
//        ["name": "兰亭序", "filename": "兰亭序.jpg"],
//        ["name": "闲居赋",    "filename": "xianjufu.jpg"],
//        ["name": "兰亭序", "filename": "兰亭序.jpg"],
//        ["name": "归去来辞",    "filename": "xianjufu.jpg"],
//        ["name": "兰亭序", "filename": "兰亭序.jpg"],
//        ["name": "归去来辞",    "filename": "xianjufu.jpg"]
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()

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
    
    func loadData() {
        let path: String! = Paths.docPath("Works.plist")
        
        let fileManager = NSFileManager.defaultManager()
        // 判断此文件是否存在
        if !fileManager.fileExistsAtPath(path) {
            // 如果不存在，则复制一个
            if let bundlePath = Paths.bundlePath("Works") {
                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
            } else {
                println("Works.plist not found.")
            }
        } else {
            println("Works.plist already exits at path.")
//            fileManager.removeItemAtPath(path, error: nil)
        }
        
        shufaLists = NSArray(contentsOfFile: path)
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
        return shufaLists.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionCellIdentifiers.mainCellIndentifier, forIndexPath: indexPath) as! MainCollectionViewCell
        
        // Configure the cell
        
        let name = shufaLists[indexPath.row].objectForKey("name") as! String
        cell.labelText = name
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        var leftRightMagrin = (collectionViewWidth - itemWidth)/2
//        return UIEdgeInsetsMake(0, leftRightMagrin, 0, leftRightMagrin);
//    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let dvc = self.storyboard?.instantiateViewControllerWithIdentifier(StoryboardId.imageViewController) as! ImageViewController
        var dict = shufaLists[indexPath.row] as! NSDictionary
        
        dvc.info = dict
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }

}
