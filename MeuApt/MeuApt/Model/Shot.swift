//
//  Shot.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class Shot: NSObject {
    var id: Int! = 0
    var title: String! = ""
    var shotDescription: String! = ""
    var viewsCount: Int! = 0
    var commentsCount: Int! = 0
    var shotCreatedAt: Date! = Date()
    
    var images: [String: String] = [
        "hidpi": "",
        "normal": "",
        "teaser": ""
    ]
    
    //    MARK: - Set
    func setDate(dateString: String){
        print(dateString)
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        self.shotCreatedAt = df.date(from: dateString)
    }
}
