//
//  ApiTVResult.swift
//  PopularTVShows
//
//  Created by Patrick Haralabidis on 28/09/2015.
//  Copyright © 2015 Patrick Haralabidis. All rights reserved.
//

import Foundation

let imagesBasePath = "http://image.tmdb.org/t/p/w500"

class ApiTVResult {
    
    var backdropPath : String!
    var firstAirDate : String!
    var genreIds : [Int]!
    var id : Int!
    var originalLanguage : String!
    var originalName : String!
    var overview : String!
    var originCountry : [Int]!
    var posterPath : String!
    var popularity : Float!
    var name : String!
    var voteAverage : Float!
    var voteCount : Int!
    
    
    /**
    * Instantiate the instance using the passed json values to set the properties values
    */
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        
        let apiBackDropPath = json["backdrop_path"].stringValue
        backdropPath = "\(imagesBasePath)\(apiBackDropPath)"
        firstAirDate = json["first_air_date"].stringValue
        genreIds = [Int]()
        let genreIdsArray = json["genre_ids"].arrayValue
        for genreIdsJson in genreIdsArray {
            genreIds.append(genreIdsJson.intValue)
        }
        id = json["id"].intValue
        originalLanguage = json["original_language"].stringValue
        originalName = json["original_name"].stringValue
        overview = json["overview"].stringValue
        originCountry = [Int]()
        let originCountryArray = json["origin_country"].arrayValue
        for originCountryJson in originCountryArray {
            originCountry.append(originCountryJson.intValue)
        }
        let apiPosterPath = json["poster_path"].stringValue
        posterPath = "\(imagesBasePath)\(apiPosterPath)"
        popularity = json["popularity"].floatValue
        name = json["name"].stringValue
        voteAverage = json["vote_average"].floatValue
        voteCount = json["vote_count"].intValue
    }
    
}