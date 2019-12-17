//
//  Meal.swift
//  FoodTracker
//
//  Created by 三浦　知明 on 2019/12/11.
//  Copyright © 2019 三浦　知明. All rights reserved.
//

import UIKit
import Foundation
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Archiving Paths
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    //MARK: NScoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // the name is required. If we cannot decode a name string, the initialize should fail
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name)as? String else {
            os_log("unable to decode the name for a Meal object", log: OSLog.default,type: .debug)
            return nil
        }
        //because photo is an optional property of Meal, just use conditional cast
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        //must call designated initializer
        self.init(name: name, photo: photo, rating: rating)
    }
    
}
