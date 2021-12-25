//
//  Bucket List Model.swift
//  Bucket
//
//  Created by administrator on 24/12/2021.
//

import Foundation

class BucketListModel {
    
    static func getAllasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        let url = URL(string: "http://saudibucketlistapi.herokuapp.com/tasks")
        
        let session = URLSession.shared
        
        session.dataTask(with: url!, completionHandler: completionHandler).resume()
        
    }
    
    static func addNewTask(objective: String, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        if let urlToRequest = URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/?format=json") {
            
            var request = URLRequest(url: urlToRequest)
            
            request.httpMethod = "POST"
            
            let bodyData = "objective=\(objective)"
            request.httpBody = bodyData.data(using: .utf8)
            
            let session = URLSession.shared
            session.dataTask(with: request as URLRequest, completionHandler: completionHandler).resume()
        }
        
    }
    
}
