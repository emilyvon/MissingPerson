//
//  PersonCollectionViewCell.swift
//  MissingPersons
//
//  Created by Mengying Feng on 26/04/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    var person:Person!
    

    func configureCell(person: Person) {
        self.person = person
        if let url = NSURL(string: "\(baseURL)\(person.personImageUrl!)") {
            downloadImage(url)
        }
    }
    
    func downloadImage(url: NSURL) {
        
        // get data in the background thread
        // once doen, put it back on the main ui thread
        getDataFromUrl(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue(), { 
                guard let data = data where error == nil else { return }
                self.personImage.image = UIImage(data: data)
                self.person.personImage = self.personImage.image
                self.personImage.clipsToBounds = true
            })
        }
    }
    
    // get data in the background thread
    func getDataFromUrl(url: NSURL, completion:(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
        }.resume()
    }
    
    func setSelected() {
    
        personImage.layer.borderWidth = 2.0
        personImage.layer.borderColor = UIColor.yellowColor().CGColor
        personImage.clipsToBounds = true
        self.person.downloadFaceId()
    }
}
