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

//        setupUI()
//
//        startPedometerUpdates()
        
        KPHealthTool.healthTool.getHealthKitStepCountData { [weak self]
            (stepCounts) in
            
            self?.dataArray = stepCounts

            let chartView = LineChartView.init(frame: CGRect.init(x: 20, y: 64 + 20, width: SCREENW - 20, height: 200))
            chartView.delegate = self
            chartView.backgroundColor = UIColor.white
            self?.view.addSubview(chartView)
            
            let data = self?.dataWithCount(36, 100)
            
            data?.setValueFont(UIFont.systemFont(ofSize: 7.0))
            
            let colors = [
                UIColor(colorLiteralRed: 137/255.0, green: 230/255.0, blue: 81/255.0, alpha: 1.0),
                UIColor(colorLiteralRed: 240/255.0, green: 240/255.0, blue: 30/255.0, alpha: 1.0),
                UIColor(colorLiteralRed: 89/255.0, green: 2199/255.0, blue: 250/255.0, alpha: 1.0),
                UIColor(colorLiteralRed: 250/255.0, green: 104/255.0, blue: 104/255.0, alpha: 1.0)]
            
            self?.setupChart(chartView, data!, colors[1])
            
//            self.tableView?.reloadData()
        }
    }
    
    func setupChart(_ chart:LineChartView, _ data:LineChartData, _ color:UIColor) {
    
        let set = data.getDataSetByIndex(0) as? LineChartDataSet
        
        set?.setCircleColor(KPColor(35, g: 207, b: 91, a: 1.0))
        
        chart.delegate = self
        
        chart.backgroundColor = KPColor(28, g: 144, b: 136, a: 1.0)
        
        chart.chartDescription?.enabled = false
        
        chart.drawGridBackgroundEnabled = false;
        chart.dragEnabled = false;
        
        chart.setScaleEnabled(false)
        chart.pinchZoomEnabled = false;
        chart.scaleXEnabled = false;

        
//        chart.setViewPortOffsets(left: 10.0, top: 0.0, right: 10.0, bottom: 0.0)
        chart.legend.enabled = false;
        
        chart.leftAxis.enabled = false;
        chart.leftAxis.spaceTop = 0.4;
        chart.leftAxis.spaceBottom = 0.4;
        chart.rightAxis.enabled = false;
        chart.xAxis.enabled = false;
        
        chart.data = data;
        
        chart.animate(xAxisDuration: 0.25)
    }
    
    func dataWithCount(_ count:Int, _ range:Double) -> LineChartData {
    
        var yVals = [ChartDataEntry]()
                
        for i in 0...6 {
        
            let val = dataArray[6 - i].stepCount!
            
            yVals.append(ChartDataEntry(x: Double(i), y: Double(val)))
        }
        
        let set1 = LineChartDataSet(values: yVals, label: "DataSet 1")
    
        set1.lineWidth = 1.75
        set1.circleRadius = 5.0
        set1.circleHoleRadius = 1.0
        set1.setColor(KPColor(35, g: 207, b: 91, a: 1.0))
        set1.fillColor = UIColor.red
        set1.drawCircleHoleEnabled = true
        set1.highlightColor = KPColor(35, g: 207, b: 91, a: 1.0)
        set1.drawCirclesEnabled = true
        
        return LineChartData.init(dataSet: set1)
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



