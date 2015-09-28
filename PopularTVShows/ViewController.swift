//
//  ViewController.swift
//  PopularTVShows
//
//  Created by Patrick Haralabidis on 27/09/2015.
//  Copyright © 2015 Patrick Haralabidis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout    {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tvShows = [ApiTVResult]()
    
    let originalCellSize = CGSizeMake(225, 354)
    let focusCellSize = CGSizeMake(240, 380)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        downloadData()
    }
    
    func downloadData () {
        ApiService.sharedInstance.getPopularTVShows {JSON, NSError in
            if NSError != nil {
                print(NSError!.debugDescription)
            }
            else {
                let apiResults = ApiResults(fromJson: JSON)
                self.tvShows = apiResults.results
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.collectionView.reloadData()
                }
            }
        }
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ShowCell", forIndexPath: indexPath) as? ShowCell {
            
            let tvShow = self.tvShows[indexPath.row]
            cell.configureCell(tvShow)
            
            return cell
        }
        else {
            return ShowCell()
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return tvShows.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(260, 430)
    }
    
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        if let previousItem = context.previouslyFocusedView as? ShowCell {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                previousItem.showImg.frame.size = self.originalCellSize
            })
        }
        if let nextItem = context.nextFocusedView as? ShowCell {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                nextItem.showImg.frame.size = self.focusCellSize
            })
        }
        
    }


}

