//
//  ShotViewController.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 17/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class ShotViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    var shot: Shot! = Shot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configInfo()
    }
    
    //    MARK: - Config
    func configInfo(){
        self.titleLabel.text = self.shot.title
        self.viewsCountLabel.text = "\(shot.viewsCount!)"
        self.commentsCountLabel.text = "\(shot.commentsCount!)"
        
        
        do {
            let attrString = try NSAttributedString(data: self.shot.shotDescription.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
            self.descriptionTextView.attributedText = attrString
        } catch {
            print(error)
        }
        
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        self.createdAtLabel.text = "\(df.string(from: shot.shotCreatedAt))"
        
        if let url = URL(string: shot.images["hidpi"]!){
            self.imageView.downloadImage(url: url)
        }
    }

}
