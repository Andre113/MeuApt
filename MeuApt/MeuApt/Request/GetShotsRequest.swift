//
//  GetShotsRequest.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class GetShotsRequest: Request {
    override func doRequest(params: [String : Any], callback: @escaping (Data?, NSError?) -> Void) {
        let fullUrl: String = self.apiURL + "shots/"
        let parameterString = params.stringFromHttpParameters()
        
        var request = URLRequest(url: URL(string: fullUrl + "?" + parameterString)!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        self.call(request: request) { (data, error) in
            callback(data, error)
        }
    }
}
