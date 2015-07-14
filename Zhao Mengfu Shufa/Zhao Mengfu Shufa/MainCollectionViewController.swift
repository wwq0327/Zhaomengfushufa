//
//  MainCollectionViewController.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

let ENDNUM = 3

class MainCollectionViewController: UICollectionViewController {
    
    var headerLabel: UILabel!
    var shufaLists: NSArray!
    
    // 按钮变量
    var addButton: UIButton!

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
        let mainLayout = ShufaLayout()
        mainLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        self.collectionView?.setCollectionViewLayout(mainLayout, animated: false)
        
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: collectionViewWidth, height: itemHeight)
        self.collectionView?.center = CGPoint(x: self.view.frame.size.width/2.0, y: self.view.frame.size.height/2.0)
        
        addButton = fontButtonWith(text: "添", fontSize: 18.0, width: 50.0, normalImageName: "Oval", highlightedImageName: "Oval_pressed")
        addButton.center = CGPointMake(view.frame.width/2.0, view.frame.height-56.0)
        addButton.addTarget(self, action: "addImage", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(addButton)
        
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
                do {
                    try fileManager.copyItemAtPath(bundlePath, toPath: path)
                } catch _ {
                }
            } else {
                print("Works.plist not found.")
            }
        } else {
            print("Works.plist already exits at path.")
            // 调试时，用于删除复制到目录中的文件。
//            fileManager.removeItemAtPath(path, error: nil)
        }
        
        let _shufaLists = NSArray(contentsOfFile: path)
        // 过滤已默认已有的作品图片
        shufaLists = _shufaLists!.filter({ $0.objectForKey("isDown") as! Bool }) as NSArray

    }
    
    func addImage() {
        let navDownImageView = self.storyboard?.instantiateViewControllerWithIdentifier(StoryboardId.navDownTableViewController) as! UINavigationController
        self.presentViewController(navDownImageView, animated: true, completion: nil)
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
    
    // 读取数据，如果数据中的isDown为false的话，则不在一张视图中显示
    // 这里只需要显示为true有的即可。
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionCellIdentifiers.mainCellIndentifier, forIndexPath: indexPath) as! MainCollectionViewCell
        
        let name = shufaLists[indexPath.row].objectForKey("name") as! String
        cell.labelText = name
     
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        var leftRightMagrin = (collectionViewWidth - itemWidth)/2
//        return UIEdgeInsetsMake(0, leftRightMagrin, 0, leftRightMagrin);
//    }
    
    // 点击则进入相应的作品视图中
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let dvc = self.storyboard?.instantiateViewControllerWithIdentifier(StoryboardId.imageViewController) as! ImageViewController
        let dict = shufaLists[indexPath.row] as! NSDictionary
        
        // 将作品的信息传递给子视图
        dvc.info = dict
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }

}
