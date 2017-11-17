//
//  DefaultActivityIndicatorView.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class DefaultActivityIndicatorView: UIActivityIndicatorView {
    init(){
        super.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        self.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.color = UIColor.defaultGreen
        self.hidesWhenStopped = true
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
