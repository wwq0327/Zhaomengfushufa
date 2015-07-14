//
//  DownTableViewController.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/7/7.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class DownTableViewController: UITableViewController {
    
    var shufaLists: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 设置行高为自动模式
        tableView.rowHeight = UITableViewAutomaticDimension
        // 对Cell高度进行估值
        tableView.estimatedRowHeight = 100.0
        
        // load nib
        var cellNib = UINib(nibName: "DownTableViewCell", bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: CollectionCellIdentifiers.downCellIndentifier)
        
        loadData()

    }

    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            // 调试时，用于删除复制到目录中的文件。
            //            fileManager.removeItemAtPath(path, error: nil)
        }
        
        shufaLists = NSArray(contentsOfFile: path)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return shufaLists.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CollectionCellIdentifiers.downCellIndentifier, forIndexPath: indexPath) as! DownTableViewCell
        
        cell.imageName.text = shufaLists[indexPath.row].objectForKey("name") as? String

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
