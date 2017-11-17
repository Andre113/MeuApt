//
//  Request.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class Request: NSObject {
    let apiURL = "https://api.dribbble.com/v1/"
    let accessToken = "4b68df35d8c853b79f30a729f2ddaac4b09544235d7315543ebc3c181c5a28b9"
    
    func doRequest(params: [String: Any], callback: @escaping(Data?, NSError?) -> Void){
        
    }
    
    func call(request: URLRequest, callback: @escaping (Data?, NSError?) -> Void){
        
        let task = URLSession.shared.dataTask(with: request) { data, response, requestError in
            var erro: NSError?
            guard let data = data, requestError == nil else {
                //Sem conexão
                erro = NSError()
                callback(nil, erro)
                return
            }
            
//            let datastring = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            print(datastring)
            
            //A requisição deu certo.
            callback(data, nil)
            return
        }
        
        task.resume()
    }
}
