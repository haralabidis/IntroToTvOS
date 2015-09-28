//
//  ApiService.swift
//  PopularTVShows
//
//  Created by Patrick Haralabidis on 27/09/2015.
//  Copyright © 2015 Patrick Haralabidis. All rights reserved.
//

import Foundation

class ApiService {
    
    let API_TV_POPULAR_URL = "http://api.themoviedb.org/3/tv/popular?api_key=ff743742b3b6c89feb59dfc138b4c12f"
    
    static let sharedInstance = ApiService()
    
    func apiGetRequest(path: String, onCompletion: (JSON, NSError?) -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data!)
            onCompletion(json, error)
        })
        task.resume()
    }
    
    
    func getPopularTVShows(onCompletion: (JSON, NSError?) -> Void) {
        apiGetRequest(API_TV_POPULAR_URL, onCompletion: { json, err in
            onCompletion(json as JSON, err as NSError?)
        })
    }

}