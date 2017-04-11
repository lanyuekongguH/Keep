//
//  KPHealthListController.swift
//  Keep
//
//  Created by Damon on 17/4/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import CoreMotion
import Charts

let KPHealthListCellIdentifier = "KPHealthListCellIdentifier"

class KPHealthListController: KPBaseViewController {

    var tableView: UITableView?
    
    var dataArray = [KPHealthData]()
    
    let pedometer = CMPedometer()
    
    var textView = UITextView()
    
    var chartView = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let chartView = LineChartView.init(frame: CGRect.init(x: 0, y: 64, width: SCREENW, height: SCREENH - 64))
        
        chartView.lineData
        chartView.delegate = self
        chartView.backgroundColor = UIColor.white
        self.view.addSubview(chartView)
        
        
        
        
        
//        setupUI()
//        
//        startPedometerUpdates()
        
//        KPHealthTool.healthTool.getHealthKitStepCountData { (stepCounts) in
//            
//            self.dataArray = stepCounts
//
//            self.tableView?.reloadData()
//        }
    }
    
    
    
    func setChart(dataPoints: [String], values: [Double]) {

        var dataEntries = [ChartDataEntry]()

//        for i in 0 .. dataPoints.count {
//        
//        
//            let dataEntry = ChartDataEntry.va
//        }
        
        
    }
    
    
    
    
    
    
    
    
    // 开始获取步数计数据
    func startPedometerUpdates() {
        //判断设备支持情况
        guard CMPedometer.isStepCountingAvailable() else {
//            self.textView.text = "\n当前设备不支持获取步数\n"
            return
        }
        
        //获取今天凌晨时间
        let cal = Calendar.current
        var comps = cal.dateComponents([.year, .month, .day], from: Date())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        let midnightOfToday = cal.date(from: comps)!
        
        //初始化并开始实时获取数据
        self.pedometer.startUpdates (from: midnightOfToday, withHandler: { pedometerData, error in
            //错误处理
            guard error == nil else {
                print(error!)
                return
            }
            
            //获取各个数据
            var text = "---今日运动数据---\n"
            if let numberOfSteps = pedometerData?.numberOfSteps {
                text += "步数: \(numberOfSteps)\n"
            }
            if let distance = pedometerData?.distance {
                text += "距离: \(distance)\n"
            }
            if let floorsAscended = pedometerData?.floorsAscended {
                text += "上楼: \(floorsAscended)\n"
            }
            if let floorsDescended = pedometerData?.floorsDescended {
                text += "下楼: \(floorsDescended)\n"
            }
            
            if #available(iOS 9.0, *) {
                if let currentPace = pedometerData?.currentPace {
                    text += "速度: \(currentPace)m/s\n"
                }
            } else {
                // Fallback on earlier versions
            }
            
            if #available(iOS 9.0, *) {
                if let currentCadence = pedometerData?.currentCadence {
                    text += "速度: \(currentCadence)步/秒\n"
                }
            } else {
                // Fallback on earlier versions
            }
            
            //在线程中更新文本框数据
            DispatchQueue.main.async{
                self.textView.text = text
            }
        })
        
    }
    
    fileprivate func setupUI() {
        
        navigationItem.title = "所有已记录的数据"
        view.backgroundColor = KPBg()
        
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        
        tableView.register(KPHealthListCell.self, forCellReuseIdentifier: KPHealthListCellIdentifier)
        
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView = tableView
        
        let textView = UITextView.init(frame: CGRect.init(x: 30, y: 100, width: 200, height: 300))
        view.addSubview(textView)
        self.textView = textView

        
    }
    
}

extension KPHealthListController: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
    
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
    
    }
    
    func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
    
    }
    
    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
    
    }
}

extension KPHealthListController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension KPHealthListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KPHealthListCellIdentifier) as! KPHealthListCell
        
        cell.healthData = dataArray[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
    }
    
}



