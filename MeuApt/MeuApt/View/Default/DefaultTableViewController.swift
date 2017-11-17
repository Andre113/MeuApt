//
//  DefaultTableViewController.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class DefaultTableViewController: UITableViewController {
    let activityView = DefaultActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
        self.configActivityView()
        
        self.setActivityViewFrame()
    }
    
    //    MARK: - Config
    func configTableView(){
        self.tableView.tableFooterView = UIView()
        self.view.backgroundColor = UIColor.groupTableViewBackground
    }
    
    //    MARK: - Activity View
    func configActivityView(){
        self.activityView.stopAnimating()
        
        self.navigationController?.view.addSubview(self.activityView)
        self.navigationController?.view.bringSubview(toFront: self.activityView)
    }
    
    func enableView(){
        self.view.isUserInteractionEnabled = true
        
        self.activityView.stopAnimating()
        self.activityView.isHidden = true
    }
    
    func disableView(){
        self.view.isUserInteractionEnabled = false
        
        self.activityView.startAnimating()
        self.activityView.isHidden = false
    }
    
    func setActivityViewFrame(){
        let bounds = UIScreen.main.bounds
        let x = bounds.width/2
        let y = bounds.height/2
        
        let center = CGPoint(x: x, y: y)
        
        self.activityView.center = center
    }
    
//    MARK - Others
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
}
