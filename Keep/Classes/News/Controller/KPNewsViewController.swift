//
//  KPNewsViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

let KPNewsHotCollectionCellIdentifier = "KPNewsHotCollectionCellIdentifier"

class KPNewsViewController: KPBaseViewController {

    fileprivate var hotItems = [KPNewsHotItem]()

    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        loadBannerData()
    }

    fileprivate func setupUI() {
    
        view.backgroundColor = KPBg()
        
        navigationItem.titleView = segmentView
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(rightItemClick))
        
        let leftItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(leftItemClick))
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
    
        
        let layout = UICollectionViewFlowLayout.init()
        
        layout.itemSize = CGSize(width: (SCREENW - 3 * 15)/2.0, height: (SCREENW - 3 * 15)/2.0 + 80)
        
        let collectionView = UICollectionView.init(frame:         CGRect(origin: CGPoint(x: 0, y: 0), size:CGSize(width: SCREENW, height: (SCREENH - 44))), collectionViewLayout: layout)
        
        collectionView.register(KPNewsHotCollectionCell.self, forCellWithReuseIdentifier: KPNewsHotCollectionCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
        
        
    }
    
    fileprivate func loadBannerData() {
        
        KPNetworkTool.shareNetworkTool.loadNewsHotData{ [weak self](hotItems) in
            
            self?.hotItems = hotItems
            
            self?.collectionView?.reloadData()
        }
        
    }
    
//    fileprivate lazy var segmentView: KPStoreTabView = {
//        let segmentView = KPSegmentView()
//        segmentView.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
//        segmentView.titiles = ["好友","小组"]
//        return segmentView
//    }()
    
    fileprivate lazy var segmentView: KPSegmentView = {
        let segmentView = KPSegmentView()
        segmentView.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        segmentView.titiles = ["好友","小组"]
        return segmentView
    }()
    
    
    func rightItemClick() {
        let publishVC = KPPublishViewController()
        let nav = KPNavigationController.init(rootViewController: publishVC)
        self.present(nav, animated: true, completion:
            nil)
    }
    
    func leftItemClick() {
        let addFriendVC = KPAddFriendController()
        navigationController?.pushViewController(addFriendVC, animated: true)
        
    }
}

extension KPNewsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let hot = hotItems[indexPath.row]
        print(hot.content ?? "无内容")
    }
}

extension KPNewsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return hotItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KPNewsHotCollectionCellIdentifier, for: indexPath) as! KPNewsHotCollectionCell
        
        cell.hotItem = hotItems[indexPath.row]
        
        return cell
    }

}

extension KPNewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsetsMake(0, 15, 0, 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
        return 30
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    
//        return 10
//    }
    
}




