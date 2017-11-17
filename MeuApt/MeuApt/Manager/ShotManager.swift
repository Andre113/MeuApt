//
//  ShotManager.swift
//  MeuApt
//
//  Created by Andre Lucas Ota on 16/11/17.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class ShotManager: NSObject {
    static let singleton = ShotManager()
    
    func getShots(callback: @escaping([Shot], NSError?) -> Void){
        let request = GetShotsRequest()
        
        let params: [String: Any] = [
            "page": "1",
            "per_page": "30"
        ]
        
        request.doRequest(params: params) { (data, error) in
            var shots: [Shot] = []
            
            if error != nil{
                callback(shots, error)
                return
            }
            
            do {
                if let data = data,
                    let shotsJson = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                    for shotJson in shotsJson{
                        shots.append(self.parseShot(shotJson: shotJson))
                    }
                    
                    callback(shots, nil)
                    return
                }
            } catch {
                print("Error deserializing JSON: \(error)")
                callback(shots, NSError())
                return
            }
        }
    }
    
    func parseShot(shotJson: [String: Any]) -> Shot{
        let shot = Shot()
        
        shot.id = shotJson["id"] as? Int ?? 0
        shot.title = shotJson["title"] as? String ?? ""
        shot.shotDescription = shotJson["description"] as? String ?? ""
        shot.viewsCount = shotJson["views_count"] as? Int ?? 0
        shot.commentsCount = shotJson["comments_count"] as? Int ?? 00
        
        let createdAt = shotJson["created_at"] as? String ?? ""
        shot.setDate(dateString: createdAt)
        
        shot.images = shotJson["images"] as? [String: String] ?? [:]
        
        return shot
    }
}
