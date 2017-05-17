//
//  KPTrainViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import SwiftyJSON
import SWTableViewCell
import AVFoundation

enum TrainType : Int {
    
    case today
    
    case fitness
    
    case run
    
    case cycling
}

let KPTrainPlanListCellIdentifier = "KPTrainPlanListCellIdentifier"

class KPTrainViewController: UIViewController {

    var tableView: UITableView?

    fileprivate var todayTableView: UITableView?
    fileprivate var fitnessTableView: UITableView?
    fileprivate var runTableView: UITableView?
    fileprivate var cyclingView: KPTrainCyclingView?
    
    fileprivate var todayItems = [KPNewsHotItem]()
    fileprivate var fitnessItems = [KPDiscoveryTrainItem]()
    fileprivate var runItems = [KPDietItem]()
    fileprivate var cyclingItems = [KPHotDetailItem]()
    
    fileprivate var scrollView: UIScrollView?
    
    var av:AVSpeechSynthesizer?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
//        navigationItem.titleView = titleView
//
//        let rightItem = UIBarButtonItem(image: UIImage(named: "icon_run_sign"), style: .plain, target: self, action: #selector(rightItemClick))
//        navigationItem.rightBarButtonItem = rightItem
        
        setupUI()
        
        
//        let button = UIButton()
//        button.setTitle("开始", for: UIControlState())
//        button.setTitleColor(UIColor.black, for: UIControlState())
//        button.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
//        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
//        self.view.addSubview(button)
    }
    
    @objc fileprivate func buttonClick() {
    
        let lineMapVc = KPTrainLineMapController()
        self.navigationController?.pushViewController(lineMapVc, animated: true)
        
//        DispatchQueue.global().async {
//        }
//        
//        DispatchQueue.main.async {
//        }
//        
//        self.av = AVSpeechSynthesizer()
//        self.av?.delegate = self;
//        let utterance = AVSpeechUtterance(string: "开始倒计时, 五秒，5秒，九秒，15秒，100秒，跑步结束,跑步距离5公里，用时50分钟,每公里平均用时10分钟。您已跑步1公里，用时10分钟，最近一公里用时4分钟。离目标还有30分钟，加快速度，加油吧！恭喜你，跑步5公里目标已达成，请确认是否结束本次跑步？")
//        utterance.rate = 0.5;
//        let voice = AVSpeechSynthesisVoice(language: "zh-CN")
//        utterance.voice = voice;
//        self.av?.speak(utterance)
        
    }
    
    fileprivate func setupUI() {
        
        view.addSubview(statusBar)

        view.addSubview(tabView)
        
        self.automaticallyAdjustsScrollViewInsets = false;
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 80, width: SCREENW, height: SCREENH - (80 + 49)))
        scrollView.backgroundColor = KPBg()
        scrollView.contentSize = CGSize(width: SCREENW * 4, height: SCREENH - (80 + 49))
        scrollView.isPagingEnabled = true
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.isDirectionalLockEnabled = true
//        scrollView.bounces = false
        scrollView.delegate = self
        view.addSubview(scrollView)
        self.scrollView = scrollView
        
        
        let todayTableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH - (80 + 49)), style: .plain)
        todayTableView.backgroundColor = KPGray()
        todayTableView.separatorStyle = .none
        todayTableView.tag = TrainType.today.rawValue
        todayTableView.backgroundColor = KPBg()
        todayTableView.register(UITableViewCell.self, forCellReuseIdentifier: KPTrainPlanListCellIdentifier)
        todayTableView.tableFooterView = UIView()
        todayTableView.delegate = self
        todayTableView.dataSource = self
        scrollView.addSubview(todayTableView)
        self.todayTableView = todayTableView
        
        let fitnessTableView = UITableView(frame: CGRect(x: SCREENW, y: 0, width: SCREENW, height: SCREENH - (80 + 49)), style: .plain)
        fitnessTableView.backgroundColor = KPLightGray()
        fitnessTableView.separatorStyle = .none
        fitnessTableView.tag = TrainType.fitness.rawValue
        fitnessTableView.backgroundColor = KPBg()
        fitnessTableView.register(UITableViewCell.self, forCellReuseIdentifier: KPTrainPlanListCellIdentifier)
        fitnessTableView.tableFooterView = UIView()
        fitnessTableView.delegate = self
        fitnessTableView.dataSource = self
        scrollView.addSubview(fitnessTableView)
        self.fitnessTableView = fitnessTableView
        
        
        let runTableView = UITableView(frame: CGRect(x: SCREENW * 2, y: 0, width: SCREENW, height: SCREENH - (80 + 49)), style: .plain)
        runTableView.backgroundColor = KPTheme()
        runTableView.separatorStyle = .none
        runTableView.tag = TrainType.run.rawValue
        runTableView.backgroundColor = KPBg()
        runTableView.register(UITableViewCell.self, forCellReuseIdentifier: KPTrainPlanListCellIdentifier)
        runTableView.tableFooterView = UIView()
        runTableView.delegate = self
        runTableView.dataSource = self
        scrollView.addSubview(runTableView)
        self.runTableView = runTableView
        
        let cyclingView = KPTrainCyclingView.init(frame: CGRect(x: SCREENW * 3, y: 0, width: SCREENW, height: SCREENH - (80 + 49)))
        scrollView.addSubview(cyclingView)
        self.cyclingView = cyclingView
    }
    
    func rightItemClick() {
        let runRecordVc = KPTrainRunRecordController()
        let nav = KPNavigationController.init(rootViewController: runRecordVc)
        self.present(nav, animated: true, completion:
        nil)
    }
    
    fileprivate lazy var titleView: UIImageView = {
        let titleView = UIImageView()
        titleView.image = UIImage(named: "keep_logo")
        titleView.frame = CGRect(x: 0, y: 0, width: 50, height: 23)
        return titleView
    }()
    
    fileprivate lazy var statusBar: UIView = {
        let statusBar = UIView()
        statusBar.frame = CGRect(x: 0, y: 0, width: SCREENW, height: 20)
        return statusBar
    }()
    
    fileprivate lazy var tabView: KPDiscoveryTabView = {
        let tabView = KPDiscoveryTabView()
        tabView.delegate = self
        tabView.frame = CGRect(x: 0, y: 20, width: SCREENW, height: 60)
        return tabView
    }()
    
    
}


extension KPTrainViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch tableView.tag {
            
            case TrainType.today.rawValue:
                
                print("today")

            case TrainType.fitness.rawValue:
                
                print("fitness")

            case TrainType.run.rawValue:
                
                print("run")
                
            case TrainType.cycling.rawValue:
                
                print("cycling")
                
            default:
                
                print("dddd")
        }
        
        
        if tableView.tag == TrainType.fitness.rawValue {
        
            print("dddd")
        }
        
        if indexPath.section == 1 {
            
        }
    }
}

extension KPTrainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: KPTrainPlanListCellIdentifier) as! KPTrainPlanListCell
        let cell = tableView.dequeueReusableCell(withIdentifier: KPTrainPlanListCellIdentifier)

        //cell.delegate = self;

        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
}


extension KPTrainViewController: SWTableViewCellDelegate {

    func swipeableTableViewCell(_ cell: SWTableViewCell!, didTriggerLeftUtilityButtonWith index: Int) {
    
    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, didTriggerRightUtilityButtonWith index: Int) {
    
    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, scrollingTo state: SWCellState) {
    
    }
    
    func swipeableTableViewCellShouldHideUtilityButtons(onSwipe cell: SWTableViewCell!) -> Bool {
    
        return true
    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, canSwipeTo state: SWCellState) -> Bool {
    
        return true
    }
    
    func swipeableTableViewCellDidEndScrolling(_ cell: SWTableViewCell!) {
    
    }
    
}

extension KPTrainViewController: AVSpeechSynthesizerDelegate {

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        
        print("Start")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        
        print("Pause")

    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        print("Cancel")

    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("Finish")

    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        print("SpeakRangeOfSpeechString")

    }
}

extension KPTrainViewController: KPDiscoveryTabButtonDelegate {

    func discoveryTabView(_ tabView: KPDiscoveryTabView, button: UIButton) {
        
    }

}


