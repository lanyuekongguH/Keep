//
//  KPHealthTool.swift
//  Keep
//
//  Created by Damon on 17/4/6.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import HealthKit

class KPHealthTool: NSObject {

    var healthStore: HKHealthStore?

    func getAuthority(){
    
        if HKHealthStore.isHealthDataAvailable() {
            
            healthStore = HKHealthStore()
            
            let type = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
            
            var set = Set<HKQuantityType>()
            set.insert(type!)
            
            healthStore?.requestAuthorization(toShare: nil, read: set, completion: { (success, error) in
                
                if success {
                
                    
                    let sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
                    
                    let start = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
                    let end = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)

                    
//                    HKSampleType
                }
                
            })
            
        }
    
    }
    
    
    
    
}
