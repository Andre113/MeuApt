//
//  ShotTableViewCell.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class ShotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //    MARK: - Set
    func setShot(shot: Shot){
        self.tituloLabel.text = shot.title
        self.viewsCountLabel.text = "Visualizações: \(shot.viewsCount!)"
        
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        self.createdAtLabel.text = "\(df.string(from: shot.shotCreatedAt))"
        
        if let url = URL(string: shot.images["teaser"]!){
            self.shotImageView.downloadImage(url: url)
        }
    }
}
