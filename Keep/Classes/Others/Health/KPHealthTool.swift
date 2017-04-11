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
    
    func getHealthKitStepCountData(_ finished:@escaping([KPHealthData]) ->()) {
    
        getAuthority { (success, error) in
            
            if success {
                
                self.readAllStepCount({ (dataArray) in
                    
                    DispatchQueue.main.async {
                        
                        finished(dataArray)

                    }
                    
                })
            }
        }
    }
    
    func getAuthority(_ finished:@escaping ((_ success:Bool, _ error:Error?)->())){
    
        if HKHealthStore.isHealthDataAvailable() {
            
            healthStore = HKHealthStore()
                        
            let readSet = healthDataToRead()
            
            let writeSet = healthDataToWrite()
            
            healthStore?.requestAuthorization(toShare: writeSet, read: readSet, completion: { (success, error) in
                
                finished(success, error)
                
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
    
    func readAllStepCount(_ finished:@escaping([KPHealthData]) ->()) {
    
        let sampleType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)

        let calendar = NSCalendar(calendarIdentifier: .gregorian)
        
        let interval = NSDateComponents()
        
        interval.day = 1
        
        var anchorComponents = calendar?.components([.day, .month, .year], from: NSDate() as Date)
        anchorComponents?.hour = 0
        
        let anchorDate = calendar?.date(from: anchorComponents!)
        
        let stepsQuery = HKStatisticsCollectionQuery(quantityType: sampleType!, quantitySamplePredicate: nil, options:[.cumulativeSum, .separateBySource], anchorDate: anchorDate!, intervalComponents: interval as DateComponents)
        
        var dataArray = [KPHealthData]()
        
        stepsQuery.initialResultsHandler = {query, results, error in

            let array = results?.statistics()
            
            array?.forEach({ (statistics) in
                
                let sources = statistics.sources
                
                
                sources?.forEach({ (source) in
                    
                    if source.name == UIDevice.current.name {
                    
                        let count = statistics.sumQuantity(for: source)?.doubleValue(for: HKUnit.count())
                        
                        let data = KPHealthData()
                        
                        data.stepCount = Int(count!)
                        
                        data.startDateComponents = calendar?.components([.second, .minute, .hour, .day, .month, .year], from: statistics.startDate as Date)

                        data.endDateComponents = calendar?.components([.second, .minute, .hour, .day, .month, .year], from: statistics.endDate as Date)

//                        print(count)
//                        print(data.startDateComponents)
//                        print(data.endDateComponents)

                        dataArray.insert(data, at: 0)
                    }
                })
            })
            finished(dataArray)
        }
        
        self.healthStore?.execute(stepsQuery)
    }
    
    func readStepCount() {
    
    }
    
}
