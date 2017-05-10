//
//  KPDiscoveryTabView.swift
//  Keep
//
//  Created by Damon on 17/5/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

protocol KPDiscoveryTabButtonDelegate: NSObjectProtocol {
    func discoveryTabView(_ tabView:KPDiscoveryTabView, button:UIButton)
}

class KPDiscoveryTabView: UIView {

    weak var delegate: KPDiscoveryTabButtonDelegate?

    var selectButton: UIButton?

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
    }
    
    var tabTitles: [String]? {
        didSet {
            
            if let tabTitles = tabTitles {
                
                let buttonW :CGFloat = 50.0
                let buttonD = (SCREENW - CGFloat(50 * tabTitles.count))/CGFloat(tabTitles.count * 2)

                for i in 0..<tabTitles.count {
                    
                    let buttonX = buttonD * CGFloat(i*2+1) + buttonW * CGFloat(i)
                    let button = UIButton()
                    button.frame = CGRect(x: buttonX, y: 0, width: buttonW, height: 44)
                    button.tag = i
                    button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
                    button.setTitle(tabTitles[i], for: UIControlState())
                    button.setTitleColor(KPGray(), for: UIControlState())
                    button.setTitleColor(KPGreen(), for: .selected)
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                    
                    if i == 0 {
                        selectButton?.isSelected = false
                        selectButton = button
                        selectButton?.isSelected = true
                    }
                    addSubview(button)
                }
                
                addSubview(lineView)
            }
        }
    }
    
    @objc fileprivate func buttonClick(_ button:UIButton) {

        selectButton?.isSelected = false
        selectButton = button
        selectButton?.isSelected = true
        
        let frame = button.frame
        
        UIView.animate(withDuration: 0.25, animations:{
            
            self.lineView.frame = CGRect(x: frame.origin.x + (50 - 36)/2.0, y: 42, width: 36, height: 2)
        })
        
        delegate?.discoveryTabView(self, button: button)
    }
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = KPGreen()
        
//        var buttonD :CGFloat = 0.0
//        
//        buttonD = (SCREENW - CGFloat(50 * tabTitles.count))/CGFloat(tabTitles.count * 2)
        
//        if let tabTitless = tabTitles {
//            
//            buttonD = (SCREENW - CGFloat(50 * tabTitles.count))/CGFloat(tabTitles.count * 2)
//        }
        
//        lineView.frame = CGRect(x: buttonD + (50 - 36)/2.0, y: 42, width: 36, height: 2)
        lineView.frame = CGRect(x: 20 + (50 - 36)/2.0, y: 42, width: 36, height: 2)

        return lineView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
