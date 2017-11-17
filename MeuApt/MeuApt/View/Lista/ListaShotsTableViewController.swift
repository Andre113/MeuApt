//
//  ListaShotsTableViewController.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class ListaShotsTableViewController: DefaultTableViewController {

    var shots: [Shot] = []
    
    let shotManager = ShotManager.singleton
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configTableView()
        self.loadShots()
    }
    
    //    MARK: - Config
    override func configTableView(){
        super.configTableView()
        
        self.tableView.register(UINib(nibName: "ShotTableViewCell", bundle: nil), forCellReuseIdentifier: "shotCell")
    }
    
    //    MARK: - Request
    func loadShots(){
        self.disableView()
        
        DispatchQueue.global(qos: .background).async {
            self.shotManager.getShots(callback: { (shots, error) in
                if error != nil{
                    DispatchQueue.main.async {
                        self.enableView()
                        
                        self.showAlert(mensagem: "Ocorreu um erro")
                        return
                    }
                } else{
                    DispatchQueue.main.async {
                        self.enableView()
                        
                        self.shots = shots
                        self.tableView.reloadData()
                        self.tableView.layoutIfNeeded()
                        return
                    }
                }
            })
        }
    }
    
    //    MARK: - TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shots.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shotCell", for: indexPath) as! ShotTableViewCell
        
        cell.setShot(shot: self.shots[indexPath.row])
        
        return cell
    }
    
    //MARK: - Alert
    func showAlert(mensagem: String){
        let alertController = UIAlertController(title: "MeuApt", message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Fechar", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}