//
//  KPNewsViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import MJRefresh
import RealmSwift
import SQLite

let KPNewsHotCollectionCellIdentifier = "KPNewsHotCollectionCellIdentifier"

let KPNewsHotHeadViewIdentifier = "KPNewsHotHeadViewIdentifier"

class KPNewsViewController: KPBaseViewController {

    fileprivate var hotItems = [KPNewsHotItem]()

    var scrollView: UIScrollView?
    
    var hotCollectionView: UICollectionView?
    var refreshControl = UIRefreshControl()
    let footer = MJRefreshAutoNormalFooter()
    
    var followTableView: UITableView?
    var followRefreshControl = UIRefreshControl()
    let followFooter = MJRefreshAutoNormalFooter()
    
    var cityTableView: UITableView?
    var cityRefreshControl = UIRefreshControl()
    let cityFooter = MJRefreshAutoNormalFooter()
    
    var lastID : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        loadBannerData()
        
        refreshControl.addTarget(self, action: #selector(loadBannerData), for: .valueChanged)
        
        hotCollectionView?.addSubview(refreshControl)
    }
    
    fileprivate func setupUI() {
    
        view.backgroundColor = KPBg()
        
        navigationItem.titleView = segmentView
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(rightItemClick))
        
        let leftItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(leftItemClick))
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
    
        // UICollectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (SCREENW - 3 * 15)/2.0, height: (SCREENW - 3 * 15)/2.0 + 80)
        
        let hotCollectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size:CGSize(width: SCREENW, height: (SCREENH - 44))), collectionViewLayout: layout)
        
        hotCollectionView.register(KPNewsHotCollectionCell.self, forCellWithReuseIdentifier: KPNewsHotCollectionCellIdentifier)
        
        hotCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KPNewsHotHeadViewIdentifier)
        
        hotCollectionView.delegate = self
        hotCollectionView.dataSource = self
        hotCollectionView.backgroundColor = UIColor.white
        view.addSubview(hotCollectionView)
        self.hotCollectionView = hotCollectionView
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(KPNewsViewController.loadBannerData))
        self.hotCollectionView?.mj_footer = footer
        
        
        
    }
    
    @objc fileprivate func loadBannerData() {
        
        KPNetworkTool.shareNetworkTool.loadNewsHotData(last: lastID) {[weak self]
        
            (data) in
            
            self?.lastID = data.1
            
            if self?.lastID != nil {
            
                self?.hotItems.append(contentsOf: data.0)
                self?.hotCollectionView?.mj_footer.endRefreshing()
                
            } else {
                self?.hotItems = data.0
            }
            
            if (self?.refreshControl.isRefreshing)! {
            
                self?.refreshControl.endRefreshing()
            }
            
            self?.hotCollectionView?.reloadData()
        }
    }
    
    fileprivate lazy var hotImageView: UIImageView = {
    
        let hotImageView = UIImageView()
        
        hotImageView.isUserInteractionEnabled = true
        let ges = UITapGestureRecognizer(target: self, action: #selector(clickHotVideo))
        hotImageView.addGestureRecognizer(ges)
        
        let urlStr = "http://static1.keepcdn.com/picture/2017/04/18/09/5fc733ac81925e13e031b8d8be0acbd282ee1465_1920x1080.jpg"
        hotImageView.kf.setImage(with: URL(string: urlStr), placeholder: nil)
        let photoSize = urlStr.getImageViewSize()
        hotImageView.frame = CGRect(x: 0, y: 0, width: photoSize.width, height: photoSize.height)
        
        let hotLabel = UILabel()
        hotLabel.text = "Hot Video"
        hotLabel.frame = CGRect(x: (SCREENW - 100)/2.0, y: 60, width: 100, height: 20)
        hotLabel.font = UIFont.boldSystemFont(ofSize: 17)
        hotLabel.textColor = UIColor.white
        hotLabel.textAlignment = .center
        hotImageView.addSubview(hotLabel)

        let lineView = UIView()
        lineView.backgroundColor = UIColor.white
        lineView.frame = CGRect(x: (SCREENW - 30)/2.0, y: 85, width: 30, height: 1.5)
        hotImageView.addSubview(lineView)
        
        let todayHotLabel = UILabel()
        todayHotLabel.frame = CGRect(x: (SCREENW - 200)/2.0, y: 105, width: 200, height: 20)
        todayHotLabel.text = "今日热门视频"
        todayHotLabel.textColor = UIColor.white
        todayHotLabel.font = UIFont.boldSystemFont(ofSize: 16)
        let attributedString = NSMutableAttributedString(string: todayHotLabel.text!, attributes: [NSKernAttributeName: (10)])
        let style = NSMutableParagraphStyle()
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSRange(location: 0, length: (todayHotLabel.text?.characters.count)!))
        todayHotLabel.attributedText = attributedString
        todayHotLabel.textAlignment = .center

        hotImageView.addSubview(todayHotLabel)

        let videoImageView = UIImageView()
        videoImageView.image = UIImage(named: "video_play_samll")
        videoImageView.frame = CGRect(x: (SCREENW - 40)/2.0, y: 140, width: 40, height: 40)
        hotImageView.addSubview(videoImageView)
        
        return hotImageView
    }()
    
    
    @objc fileprivate func clickHotVideo() {
    
        let hotVideoVC = KPNewsHotVideoController()
        self.navigationController?.pushViewController(hotVideoVC, animated: true)
    }
    
    fileprivate lazy var segmentView: KPSegmentView = {
        let segmentView = KPSegmentView(frame: CGRect(x: 0, y: 0, width: 0, height: 44), ["热门","关注","同城"])
        segmentView.delegate = self
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
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KPNewsHotHeadViewIdentifier, for: indexPath as IndexPath)
            footerView.addSubview(hotImageView)

            return footerView
        }
    }
}

extension KPNewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsetsMake(15, 15, 0, 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    
        let urlStr = "http://static1.keepcdn.com/picture/2017/04/18/09/5fc733ac81925e13e031b8d8be0acbd282ee1465_1920x1080.jpg"
        return urlStr.getImageViewSize()
    }
}

extension KPNewsViewController: KPSegmentViewDelegate {

    func segmentView(_ segmentView: KPSegmentView, button: UIButton) {
        
        print("点击了",button.tag)
    }

}

