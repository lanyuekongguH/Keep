//
//  KPNewsViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import MJRefresh

let KPNewsHotCollectionCellIdentifier = "KPNewsHotCollectionCellIdentifier"

let KPNewsHotHeadViewIdentifier = "KPNewsHotHeadViewIdentifier"

class KPNewsViewController: KPBaseViewController {

    fileprivate var hotItems = [KPNewsHotItem]()

    var collectionView: UICollectionView?
    
    var refreshControl = UIRefreshControl()
    
    let footer = MJRefreshAutoNormalFooter()

    var lastID : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        loadBannerData()
        
        refreshControl.addTarget(self, action: #selector(loadBannerData), for: .valueChanged)
        
        collectionView?.addSubview(refreshControl)
    }

    
    fileprivate func setupUI() {
    
        view.backgroundColor = KPBg()
        
        navigationItem.titleView = segmentView
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(rightItemClick))
        
        let leftItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(leftItemClick))
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
    
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: (SCREENW - 3 * 15)/2.0, height: (SCREENW - 3 * 15)/2.0 + 80)
        layout.headerReferenceSize = CGSize(width: SCREENW, height: 150)
        
        let collectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size:CGSize(width: SCREENW, height: (SCREENH - 44))), collectionViewLayout: layout)
        
        collectionView.register(KPNewsHotCollectionCell.self, forCellWithReuseIdentifier: KPNewsHotCollectionCellIdentifier)
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KPNewsHotHeadViewIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(KPNewsViewController.loadBannerData))
        self.collectionView?.mj_footer = footer
    }
    
    @objc fileprivate func loadBannerData() {
        
        KPNetworkTool.shareNetworkTool.loadNewsHotData(last: lastID) {[weak self]
        
            (data) in
            
            self?.lastID = data.1
            
            if self?.lastID != nil {
            
                self?.hotItems.append(contentsOf: data.0)
                self?.collectionView?.mj_footer.endRefreshing()
                
            } else {
                self?.hotItems = data.0
            }
            
            if (self?.refreshControl.isRefreshing)! {
            
                self?.refreshControl.endRefreshing()
            }
            
            self?.collectionView?.reloadData()
        }
    }
    
    fileprivate lazy var hotImageView: UIImageView = {
    
        let hotImageView = UIImageView()
        hotImageView.frame = CGRect.init(x: 0, y: 0, width: SCREENW, height: 150)
        return hotImageView
    }()
    
    
//    fileprivate lazy var segmentView: KPStoreTabView = {
//        let segmentView = KPSegmentView()
//        segmentView.frame = CGRect(x: 0, y: 0, width: 150, height: 44)
//        segmentView.titiles = ["热门","关注","同城"]
//        return segmentView
//    }()
//    
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
    
        let hotDetailVC = KPHotDetailController()
        
        hotDetailVC.userID = hotItems[indexPath.row].id
        
        self.navigationController?.pushViewController(hotDetailVC, animated: true)
        
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

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KPNewsHotHeadViewIdentifier, for: indexPath as IndexPath)
            
            headerView.addSubview(hotImageView)
            return headerView
            
        } else {
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: KPNewsHotHeadViewIdentifier, for: indexPath as IndexPath)
            footerView.addSubview(hotImageView)

            return footerView
        }
    }
}

extension KPNewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsetsMake(0, 15, 0, 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
        return 30
    }
    
}




