//
//  UIImageViewExtension.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 17/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

extension UIImageView{
    //MARK: - Image
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            //            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.image = UIImage(data: data)
            }
        }
    }
}
