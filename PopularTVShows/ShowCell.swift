//
//  ShowCell.swift
//  PopularTVShows
//
//  Created by Patrick Haralabidis on 28/09/2015.
//  Copyright © 2015 Patrick Haralabidis. All rights reserved.
//

import UIKit

class ShowCell: UICollectionViewCell {
    
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var showLbl: UILabel!
    
    func configureCell(tvShow: ApiTVResult) {
        
        if let title = tvShow.name {
            showLbl.text = title
        }
        
        if let path = tvShow.posterPath {
            let url = NSURL(string: path)!
            
            dispatch_async (dispatch_get_global_queue (DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                let data = NSData(contentsOfURL: url)!
                
                dispatch_async(dispatch_get_main_queue()) {
                    let img = UIImage(data: data)
                    self.showImg.image = img
                }
                
            }
        }
    }
}

