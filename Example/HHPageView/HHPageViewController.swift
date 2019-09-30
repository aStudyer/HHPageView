//
//  HHPageViewController.swift
//  HHPageView_Example
//
//  Created by aStudyer on 2019/9/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import HHUIBase_Swift
import HHPageView

class HHPageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.搞定frame
        let y = navigationController?.navigationBar.frame.maxY ?? 64
        let pageViewFrame = CGRect(x: 0, y: y, width: view.bounds.width, height: view.bounds.height - y)
        
        // 2.所有的标题
        let titles = ["关注", "推荐", "热点", "视频", "小视频", "问答", "图片", "娱乐", "科技", "懂车帝", "财经", "军事", "直播", "体育", "国际", "健康", "房产"]
        
        // 3.titleView的样式
        let style = HHTitleStyle()
        style.titleHeight = 44
        style.isScrollEnable = true
        style.isShowCover = true
        
        // 4.初始化所有的子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            childVcs.append(vc)
        }
        
        // 5.创建HHPageView
        let pageView = HHPageView(frame: pageViewFrame, titles: titles, style: style, childVcs: childVcs, parentVc: self)
        
        // 6.将pageView添加到控制器的view中
        view.addSubview(pageView)
    }
    
}
