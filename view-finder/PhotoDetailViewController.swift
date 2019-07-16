//
//  PhotoDetailViewController.swift
//  view-finder
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var photoDetail: UIImageView!
//    @IBOutlet weak var detailPhoto: UIImageView!
    var photo : Photos? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realPhoto = photo {
            title = realPhoto.caption
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    photoDetail.image = cellPhotoImage
                }
                
            }
        
            
        }

       
    }
    

}
