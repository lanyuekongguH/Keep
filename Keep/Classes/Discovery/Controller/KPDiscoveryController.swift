//
//  KPDiscoveryController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import MJRefresh

let KPStoreCarouselCellIdentifier = "KPStoreCarouselCellIdentifier"
let KPStoreBannerCellIdentifier = "KPStoreBannerCellIdentifier"
let KPStoreProductCellIdentifier = "KPStoreProductCellIdentifier"

enum TableViewType : Int {
    
    case featured
    
    case train
    
    case diet
    
    case mall
}

class KPDiscoveryController: KPBaseViewController {

    fileprivate var banners = [KPStoreBanner]()

    fileprivate var featuredTableView: UITableView?
    fileprivate var trainTableView: UITableView?
    fileprivate var dietTableView: UITableView?
    fileprivate var mallTableView: UITableView?

    fileprivate var featuredRefreshControl = UIRefreshControl()
    fileprivate var trainRefreshControl = UIRefreshControl()
    fileprivate var dietRefreshControl = UIRefreshControl()
    fileprivate var mallRefreshControl = UIRefreshControl()

    fileprivate var hotItems = [KPNewsHotItem]()
    fileprivate var followItems = [KPHotDetailItem]()
    fileprivate var cityItems = [KPHotDetailItem]()
    
    fileprivate var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBar

        setupUI()
        
        loadBannerData()
    }

    fileprivate func setupUI() {

        view.backgroundColor = KPBg()
        self.automaticallyAdjustsScrollViewInsets = false;

        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 64 + 44, width: SCREENW, height: SCREENH - (64 + 44)))
        scrollView.backgroundColor = KPBg()
        scrollView.contentSize = CGSize(width: SCREENW * 4, height: SCREENH - (64 + 44))
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
        scrollView.bounces = false
        scrollView.delegate = self
        self.scrollView = scrollView
        view.addSubview(scrollView)
        
        // 精选
        let featuredTableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH - (64 + 44)), style: .plain)
        featuredTableView.tag = TableViewType.featured.rawValue
        featuredTableView.backgroundColor = KPBg()
        featuredTableView.register(KPStoreCarouselCell.self, forCellReuseIdentifier: KPStoreCarouselCellIdentifier)
        featuredTableView.register(KPStoreBannerCell.self, forCellReuseIdentifier: KPStoreBannerCellIdentifier)
        featuredTableView.register(KPStoreProductCell.self, forCellReuseIdentifier: KPStoreProductCellIdentifier)
        featuredTableView.tableFooterView = UIView()
        featuredTableView.delegate = self
        featuredTableView.dataSource = self
        scrollView.addSubview(featuredTableView)
        self.featuredTableView = featuredTableView
        
        featuredRefreshControl.addTarget(self, action: #selector(loadNewData), for: .valueChanged)
        self.featuredTableView?.addSubview(featuredRefreshControl)
        
        // 训练
        let trainTableView = UITableView(frame: CGRect(x: SCREENW, y: 0, width: SCREENW, height: SCREENH - (64 + 44)), style: .plain)
        trainTableView.tag = TableViewType.featured.rawValue
        trainTableView.backgroundColor = KPBg()
        trainTableView.register(KPStoreCarouselCell.self, forCellReuseIdentifier: KPStoreCarouselCellIdentifier)
        trainTableView.register(KPStoreBannerCell.self, forCellReuseIdentifier: KPStoreBannerCellIdentifier)
        trainTableView.register(KPStoreProductCell.self, forCellReuseIdentifier: KPStoreProductCellIdentifier)
        trainTableView.tableFooterView = UIView()
        trainTableView.delegate = self
        trainTableView.dataSource = self
        scrollView.addSubview(trainTableView)
        self.trainTableView = trainTableView
        
        trainRefreshControl.addTarget(self, action: #selector(loadNewData), for: .valueChanged)
        self.trainTableView?.addSubview(trainRefreshControl)
        
        // 饮食
        let dietTableView = UITableView(frame: CGRect(x: SCREENW * 2, y: 0, width: SCREENW, height: SCREENH - (64 + 44)), style: .plain)
        dietTableView.tag = TableViewType.featured.rawValue
        dietTableView.backgroundColor = KPBg()
        dietTableView.register(KPStoreCarouselCell.self, forCellReuseIdentifier: KPStoreCarouselCellIdentifier)
        dietTableView.register(KPStoreBannerCell.self, forCellReuseIdentifier: KPStoreBannerCellIdentifier)
        dietTableView.register(KPStoreProductCell.self, forCellReuseIdentifier: KPStoreProductCellIdentifier)
        dietTableView.tableFooterView = UIView()
        dietTableView.delegate = self
        dietTableView.dataSource = self
        scrollView.addSubview(dietTableView)
        self.dietTableView = dietTableView
        
        dietRefreshControl.addTarget(self, action: #selector(loadNewData), for: .valueChanged)
        self.dietTableView?.addSubview(dietRefreshControl)
        
        // 商城
        let mallTableView = UITableView(frame: CGRect(x: SCREENW * 3, y: 0, width: SCREENW, height: SCREENH - (64 + 44)), style: .plain)
        mallTableView.tag = TableViewType.featured.rawValue
        mallTableView.backgroundColor = KPBg()
        mallTableView.register(KPStoreCarouselCell.self, forCellReuseIdentifier: KPStoreCarouselCellIdentifier)
        mallTableView.register(KPStoreBannerCell.self, forCellReuseIdentifier: KPStoreBannerCellIdentifier)
        mallTableView.register(KPStoreProductCell.self, forCellReuseIdentifier: KPStoreProductCellIdentifier)
        mallTableView.tableFooterView = UIView()
        mallTableView.delegate = self
        mallTableView.dataSource = self
        scrollView.addSubview(mallTableView)
        self.mallTableView = mallTableView
        
        mallRefreshControl.addTarget(self, action: #selector(loadNewData), for: .valueChanged)
        self.mallTableView?.addSubview(mallRefreshControl)
        
        tabView.tabTitles = ["精选","训练","饮食","商城"]
        view.addSubview(tabView)
    }
    
    func loadNewData() {

        if self.featuredRefreshControl.isRefreshing {
            
            self.featuredRefreshControl.endRefreshing()
        }
        
        if self.trainRefreshControl.isRefreshing {
            
            self.trainRefreshControl.endRefreshing()
        }
        
        if self.dietRefreshControl.isRefreshing {
            
            self.dietRefreshControl.endRefreshing()
        }
        
        if self.mallRefreshControl.isRefreshing {
            
            self.mallRefreshControl.endRefreshing()
        }
    }
    
    fileprivate func loadBannerData() {
        
        
        KPNetworkTool.shareNetworkTool.loadAdsBannerData(url: "https://api.gotokeep.com/v1.1/ads/banner?type=2", {[weak self](banners) in
        

            print("banners",banners)
            
        })


        
        KPNetworkTool.shareNetworkTool.loadStoreBannerData{ [weak self](banners) in
            
            self?.banners = banners
        }
    }
    
    fileprivate lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: SCREENW - 40, height: 30)
        searchBar.placeholder = "查找课程、用户、话题和商品"
        return searchBar
    }()
    
    fileprivate lazy var tabView: KPDiscoveryTabView = {
        let tabView = KPDiscoveryTabView()
        tabView.delegate = self
        tabView.frame = CGRect(x: 0, y: 64, width: SCREENW, height: 44)
        return tabView
    }()
}

extension KPDiscoveryController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let webVc = KPWKWebViewController()
        navigationController?.pushViewController(webVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 10
        }
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRect.init(x: 0, y: 0, width: SCREENW, height: 10)
        view.backgroundColor = KPBg()
        return view
    }
}

extension KPDiscoveryController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        switch tableView.tag {
//            
//        case TableViewType.featured.rawValue:
//            {
//            
//                print("ddd")
//            }
//            
//        case TableViewType.train.rawValue:
//            {
//                print("ddd")
//
//            }
//
//        case TableViewType.diet.rawValue:
//            {
//                print("ddd")
//            
//            }
//        case TableViewType.mall.rawValue:
//            {
//                print("ddd")
//                
//            }
//            
//        }
        
        
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            
            cell = tableView.dequeueReusableCell(withIdentifier: KPStoreCarouselCellIdentifier) as! KPStoreCarouselCell
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: KPStoreBannerCellIdentifier) as! KPStoreBannerCell
            
            var mineListCell = KPStoreBannerCell()
            mineListCell = cell as! KPStoreBannerCell;
            
            mineListCell.banners = banners
            return mineListCell
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 || indexPath.section == 2 {
            return 190
        } else {
            return 100
        }
    }
    
}

extension KPDiscoveryController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.isDragging {
        
            tabView.offsetRate = scrollView.contentOffset.x / SCREENW
        }
    }
}

extension KPDiscoveryController: KPDiscoveryTabButtonDelegate {
    
    func discoveryTabView(_ tabView: KPDiscoveryTabView, button: UIButton) {
        
        scrollView?.setContentOffset(CGPoint(x: (button.tag - 1000) * Int(SCREENW), y: 0), animated: true)
    }
}
