//
//  ApiResults.swift
//  PopularTVShows
//
//  Created by Patrick Haralabidis on 28/09/2015.
//  Copyright © 2015 Patrick Haralabidis. All rights reserved.
//

import Foundation

class ApiResults {
    
    var page : Int!
    var results : [ApiTVResult]!
    var totalPages : Int!
    var totalResults : Int!
    
    
    /**
    * Instantiate the instance using the passed json values to set the properties values
    */
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        page = json["page"].intValue
        results = [ApiTVResult]()
        let resultsArray = json["results"].arrayValue
        for resultsJson in resultsArray{
            let value = ApiTVResult(fromJson: resultsJson)
            results.append(value)
        }
        totalPages = json["total_pages"].intValue
        totalResults = json["total_results"].intValue
    }
    
}