//
//  ViewController.swift
//  HHPageView
//
//  Created by aStudyer on 09/14/2019.
//  Copyright (c) 2019 aStudyer. All rights reserved.
//

import UIKit
import HHPageView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        automaticallyAdjustsScrollViewInsets = false
        
        // 1.搞定frame
        let y = navigationController?.navigationBar.frame.maxY ?? 64
        let pageViewFrame = CGRect(x: 0, y: y, width: view.bounds.width, height: view.bounds.height - y)
        
        // 2.所有的标题
        let titles = ["推荐", "手游玩法大全", "娱乐手", "游戏游戏", "趣玩", "游戏游戏", "趣玩"]
        
        // 3.titleView的样式
        let style = HHPageStyle()
        style.titleViewHeight = 44
        style.isScrollEnable = true        
        style.isShowCoverView = false
        
        // 4.初始化所有的子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            childVcs.append(vc)
        }
        
        // 5.创建HHPageView
        let pageView = HHPageView(frame: pageViewFrame, titles: titles, titleStyle: style, childVcs: childVcs, parentVc: self)
        
        // 6.将pageView添加到控制器的view中
        view.addSubview(pageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

