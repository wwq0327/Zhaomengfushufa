//
//  ImageViewController.swift
//  Zhao Mengfu Shufa
//
//  Created by wyatt on 15/6/24.
//  Copyright (c) 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(image: UIImage(named: "兰亭序.jpg"))
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