//
//  PostTableViewController.swift
//  view-finder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    var photos : [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        func getPhotos() {
            if let context = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext
            {
                if let coreDataPhotos = try?
                    context.fetch(Photos.fetchRequest()) as? [Photos] {
                    photos = coreDataPhotos
                    tableView.reloadData()
                    //Part Cady wants to see!!!
                }
            }
        }
       override func viewWillAppear(_ animated: Bool) {
            getPhotos() }
            
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption
        
        if let cellPhotoImageData = cellPhoto.imageData {
            if let cellPhotoImage = UIImage(data : cellPhotoImageData){
                cell.imageView?.image = cellPhotoImage
            }
        
        }
        return cell
    }
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Bool {
        performSegue(withIdentifier: "detailSegue", sender: photos[indexPath.row])
        return true
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            if let photoDetailView = segue.destination as?
                PhotoDetailViewController{
                if let photoToSend = sender as? Photos {
                    photoDetailView.photo = photoToSend
                }
                func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
                    // Return false if you do not want the specified item to be editable.
                    return true
                }
                func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                    if editingStyle == .delete {s
                       if let context =
                        (UIApplication.shared.delegate as?
                            AppDelegate)?.persistentContainer.viewContext {
                        let photoToDelete = photos[indexPath.row]
                        
                    }
                }
            }
        }
    }
}
}
