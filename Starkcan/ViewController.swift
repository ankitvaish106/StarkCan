//
//  ViewController.swift
//  Starkcan
//
//  Created by NTGMM-01 on 18/04/18.
//  Copyright © 2018 Starkcan. All rights reserved.
//


import UIKit
import FSPagerView
class ViewController: UIViewController, FSPagerViewDataSource,FSPagerViewDelegate   {
    let slideImageCount = 3
     fileprivate let imageNames = ["1.jpg","2.jpg","3.jpg"]
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = .zero
        }
    }
    
    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            self.pageControl.numberOfPages = slideImageCount
            self.pageControl.contentHorizontalAlignment = .right
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pagerView.automaticSlidingInterval = 3.0
        self.pagerView.isInfinite = true
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return slideImageCount
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
       // cell.textLabel?.text = index.description+index.description
        return cell
    }
}

