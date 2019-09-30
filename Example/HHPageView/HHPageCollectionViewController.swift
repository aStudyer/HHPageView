//
//  HHPageCollectionViewController.swift
//  HHPageView_Example
//
//  Created by aStudyer on 2019/9/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import HHUIBase_Swift
import HHPageView

class HHPageCollectionViewController: BaseViewController {
    private let titles = ["土豪", "热门", "专属", "常见"]
    private let kEmoticonCell = "kEmoticonCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pageFrame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 300)
        
        
        let style = HHTitleStyle()
        style.isShowBottomLine = true
        
        let layout = HHPageCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.cols = 4
        layout.rows = 2
        
        let pageCollectionView = HHPageCollectionView(frame: pageFrame, titles: titles, style: style, isTitleInTop: false, layout: layout)
        
        pageCollectionView.dataSource = self
        pageCollectionView.register(cell: UICollectionViewCell.self, identifier: kEmoticonCell)
        
        view.addSubview(pageCollectionView)
    }
}

extension HHPageCollectionViewController: HHPageCollectionViewDataSource {
    func numberOfSections(in pageCollectionView: HHPageCollectionView) -> Int {
        return titles.count
    }
    
    func pageCollectionView(_ collectionView: HHPageCollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 20
        } else {
            return 14
        }
    }
    
    func pageCollectionView(_ pageCollectionView: HHPageCollectionView, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kEmoticonCell, for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
    }
}
