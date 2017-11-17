//
//  HomeViewController.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var iniciarButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configIniciarButton()
    }
    
    //    MARK: - Config
    func configIniciarButton(){
        self.iniciarButton.layer.cornerRadius = 5.0
        self.iniciarButton.clipsToBounds = true
    }
    
    //    MARK: - Action
    @IBAction func iniciarButtonTouched(_ sender: Any) {
    }
}
