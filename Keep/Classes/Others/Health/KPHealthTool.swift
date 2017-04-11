//
//  KPHealthTool.swift
//  Keep
//
//  Created by Damon on 17/4/6.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import HealthKit
import Foundation

final class KPHealthTool: HKHealthStore {

    static let healthTool = KPHealthTool()
    
    private override init() {}

    var healthStore: HKHealthStore?
    
    func getAuthority(_ finished:@escaping ((_ success:Bool, _ error:Error)->())){
    
        if HKHealthStore.isHealthDataAvailable() {
            
            healthStore = HKHealthStore()
                        
            let readSet = healthDataToRead()
            
            let writeSet = healthDataToWrite()

            healthStore?.requestAuthorization(toShare: writeSet, read: readSet, completion: { (success, error) in
                
//                finished(success, error!)

                if success {
                
                    self.readAllStepCount()
                }
            })
            
        } else {
        
            let error = NSError(domain: "", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            finished(false,error)

        }
    
    }
    
    
    fileprivate func healthDataToWrite() -> Set<HKSampleType> {
    
        let stepCount = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount);
        
        let walkDistance = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning);
        
        let activeEnergyBurn = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned);

        let heart = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate);

        let height = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height);

        let weight = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass);

        let climbed = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed);

        return NSSet.init(arrayLiteral: stepCount!,walkDistance!,activeEnergyBurn!,heart!,height!,weight!,climbed!) as! Set<HKSampleType>
    }
    
    fileprivate func healthDataToRead() -> Set<HKSampleType> {

        let stepCount = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount);
        
        let walkDistance = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning);
        
        let activeEnergyBurn = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned);
        
        let heart = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate);
        
        let height = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height);
        
        let weight = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass);
        
        let climbed = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed);
        
        return NSSet.init(arrayLiteral: stepCount!,walkDistance!,activeEnergyBurn!,heart!,height!,weight!,climbed!) as! Set<HKSampleType>
        
    }
    
    
    func readAllStepCount() {
    
        let sampleType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)

        let calendar = NSCalendar.current
        
        let interval = NSDateComponents()
        
        interval.day = 1
        
        var anchorComponents = calendar.dateComponents([.day, .month, .year], from: NSDate() as Date)
        anchorComponents.hour = 0
        
        let anchorDate = calendar.date(from: anchorComponents)
        
        let stepsQuery = HKStatisticsCollectionQuery(quantityType: sampleType!, quantitySamplePredicate: nil, options: .cumulativeSum, anchorDate: anchorDate!, intervalComponents: interval as DateComponents)
        
        stepsQuery.initialResultsHandler = {query, results, error in

            let array = results?.statistics()
            
            array?.forEach({ (statistics) in
                
                statistics.sources?.forEach({ (source) in
                    
                    if source.name == UIDevice.current.name {
                    
                        let count = statistics.sumQuantity(for: source)?.doubleValue(for: HKUnit.count())
                        
                        let data = KPHealthData()
                        
                        data.stepCount = count!
                        
//                        data.startDateComponents = calendar.component([.day, .month, .year], from: statistics.startDate)
//                        
//                        
//                        data.endDateComponents =


                        
                        
                    }
                    
//                    sou
//                    source.na
//                    
//                    
//                    
//                    
//                    if source.name
//                    if ([source.name isEqualToString:[UIDevice currentDevice].name]) {//只取设备的步数，过滤其他第三方应用的

                    
                })
            })
            
            
            
//            cocoaArray.enumerateObjectsUsingBlock({ object, index, stop in
//                //your code
//            })
            
            
        }
        
        self.healthStore?.execute(stepsQuery)

        
//        let allComponent = NSDateComponents()
//        allComponent.day = 1
//        
//        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier(rawValue: NSGregorianCalendar))
//        
//        let currentComponents = calendar?.component([.hour,.minute,.second], from: NSDate() as Date)
//    
//        let endDate = NSDate(timeIntervalSinceNow:Double(currentComponents!))
//        
//        let anchorComponents = calendar?.components([NSCalendar.Unit.year,NSCalendar.Unit.month,NSCalendar.Unit.day,NSCalendar.Unit.hour,NSCalendar.Unit.minute,NSCalendar.Unit.second], from: endDate as Date)
//        
//    
//        let anchorDate = calendar?.date(from: anchorComponents!)
//        
//    
//        
//        
//        let query = HKStatisticsCollectionQuery(quantityType: sampleType!, quantitySamplePredicate: nil, options:[HKStatisticsOptions.cumulativeSum,HKStatisticsOptions.separateBySource], anchorDate: anchorDate!, intervalComponents: allComponent as DateComponents)
//        
//        
//        query.initialResultsHandler = {
//            
//            query, results, error in
//            
//            guard let statsCollection = results else {
//
//                fatalError("*** An error occurred while calculating the statistics: \(error?.localizedDescription) ***")
//            }
//            
//            
////            let array = [HKStatistics]
////            
////            array.enumerated(
////            
////            )
//            
//            
//            let array = results?.statistics()
//            
//            
//            print(array)
        
            
            
            
//            let endDate = NSDate()
//            
//            guard let startDate = calendar.dateByAddingUnit(.Month, value: -3, toDate: endDate, options: []) else {
//                fatalError("*** Unable to calculate the start date ***")
//            }
//            
//            // Plot the weekly step counts over the past 3 months
//            statsCollection.enumerateStatisticsFromDate(startDate, toDate: endDate) { [unowned self] statistics, stop in
//                
//                if let quantity = statistics.sumQuantity() {
//                    let date = statistics.startDate
//                    let value = quantity.doubleValueForUnit(HKUnit.countUnit())
//                    
//                    // Call a custom method to plot each data point.
//                    self.plotWeeklyStepCount(value, forDate: date)
//                }
//            }
            
            
        
//        }
        
        
//
//        
//        public init(quantityType: HKQuantityType, quantitySamplePredicate: NSPredicate?, options: HKStatisticsOptions = [], anchorDate: Date, intervalComponents: DateComponents)

    }
    
    func readStepCount() {
    
    
//        let sampleType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
//        
//        let startDate = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
//        let endDate = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
//
//        let calender = NSCalendar.current
//
//        let unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
//        
//        calender.component(unitFlags, from: <#T##Date#>)
//        NSDateComponents *dateComponent = [calender components:unitFlags fromDate:now];
//
//        
//        
//        
//        
//        
//        
//        let now = NSDate.date
//        
//        HKQuery.predicateForSamples(withStart: <#T##Date?#>, end: <#T##Date?#>, options: HKQueryOptionNone)
//        
//        HKSampleQuery.init(sampleType: sampleType, predicate: <#T##NSPredicate?#>, limit: <#T##Int#>, sortDescriptors: <#T##[NSSortDescriptor]?#>, resultsHandler: <#T##(HKSampleQuery, [HKSample]?, Error?) -> Void#>)
        
        
    }
    
}
