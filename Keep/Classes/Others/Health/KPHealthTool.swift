//
//  KPHealthTool.swift
//  Keep
//
//  Created by Damon on 17/4/6.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import HealthKit


final class KPHealthTool: NSObject {

    static let healthTool = KPHealthTool()
    
    private override init() {}

    var healthStore: HKHealthStore?
    
    func getAuthority(_ finished:@escaping ((_ success:Bool, _ error:Error)->())){
    
        if HKHealthStore.isHealthDataAvailable() {
            
            healthStore = HKHealthStore()
                        
            let readSet = healthDataToRead()
            
            let writeSet = healthDataToWrite()

            healthStore?.requestAuthorization(toShare: writeSet, read: readSet, completion: { (success, error) in
                
                finished(success, error!)

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

        let allComponent = NSDateComponents()
        allComponent.day = 1
        
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier(rawValue: NSGregorianCalendar))
        
    
        let currentComponents = calendar?.component([NSCalendar.Unit.hour,NSCalendar.Unit.minute,NSCalendar.Unit.second], from: NSDate() as Date)
    
        let endDate = NSDate(timeIntervalSinceNow:Double(currentComponents!))
        
        
        
//        HKStatisticsCollectionQuery.init(quantityType: <#T##HKQuantityType#>, quantitySamplePredicate: nil, options: HKStatisticsOptionCumulativeSum | HKStatisticsOptionSeparateBySource, anchorDate: <#T##Date#>, intervalComponents: <#T##DateComponents#>)
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
