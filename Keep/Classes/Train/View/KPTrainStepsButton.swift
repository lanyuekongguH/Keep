//
//  KPTrainStepsButton.swift
//  Keep
//
//  Created by Damon on 17/5/17.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

enum TrainStepsType : Int {
    
    case begin

    case pause
    
    case keep
    
    case end
    
    case lock
}

class KPTrainStepsButton: UIView {

    init(type:TrainStepsType) {
    
        super.init(frame: CGRect.zero)

        switch type {
            
            case .begin:
                print("sss")
            case .pause:
                print("sss")

            case .keep:
                print("sss")

            case .end:
                print("sss")

            case .lock:
                print("sss")

        }
        
    }

    fileprivate func setupUI() {
  
    }
    
    fileprivate lazy var circleLineLayer: CALayer = {
        
        let circleLineLayer = CALayer()
        return circleLineLayer
    }()
    
    fileprivate lazy var circleBgLayer: CALayer = {
        
        let circleBgLayer = CALayer()
        return circleBgLayer
    }()
    
    fileprivate lazy var titLabel: UILabel = {
        
        let titLabel = UILabel()
        return titLabel
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
