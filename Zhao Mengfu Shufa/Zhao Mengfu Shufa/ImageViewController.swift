//
//  ImageViewController.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageName: String!
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    var buttonFontSize: CGFloat = 18.0
    var backButton: UIButton!
    var baikeButton: UIButton!
    var buttonsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(image: UIImage(named: imageName))
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.yellowColor()
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        // 设置原点位置
        scrollView.contentOffset = CGPoint(x: 1000, y: 450)
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        scrollView.delegate = self
        setZoomScale()
        
        setupUI()
        showButtons()
        
        setupGestureRecognizer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 改变方向
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    func setupUI() {
        buttonsView = UIView(frame: CGRectMake(0, screenRect.height, screenRect.width, 80.0))
        buttonsView.backgroundColor = UIColor.clearColor()
        buttonsView.alpha = 1.0
        
        backButton = fontButtonWith(text: "回", fontSize: buttonFontSize, width: 50.0, normalImageName: "Oval", highlightedImageName: "Oval_pressed")
        backButton.center = CGPointMake(buttonsView.frame.width/2.0-56.0, buttonsView.frame.height/2.0)
        backButton.addTarget(self, action: "backToMain", forControlEvents: UIControlEvents.TouchUpInside)
        buttonsView.addSubview(backButton)
        
        baikeButton = fontButtonWith(text: "详", fontSize: buttonFontSize, width: 50.0, normalImageName: "Oval", highlightedImageName: "Oval_pressed")
        baikeButton.center = CGPointMake(backButton.center.x+112.0, backButton.center.y)
        baikeButton.addTarget(self, action: "baiduBaike", forControlEvents: UIControlEvents.TouchUpInside)
        buttonsView.addSubview(baikeButton)
        
        self.view.addSubview(buttonsView)
    }
    
    func backToMain() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func baiduBaike() {
        let navBaikeViewController = self.storyboard?.instantiateViewControllerWithIdentifier(StoryboardId.navBaike) as! UINavigationController
        self.presentViewController(navBaikeViewController, animated: true, completion: nil)
    }
    
    func showButtons() {
        self.buttonsView.center = CGPointMake(self.buttonsView.center.x, screenRect.height-self.buttonsView.frame.size.height/2.0)
    }
    // 设置缩放属性
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        // 最小值取宽或高的最小值
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        
        scrollView.zoomScale = 1.0
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    func setupGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self, action: "handleDoubleTap:")
        doubleTap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTap)
    }
    
    func handleDoubleTap(sender: UITapGestureRecognizer) {
        if scrollView.zoomScale > scrollView.minimumZoomScale {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }

}
