//
//  BrowseableItem.swift
//  iOS Browse Mockup
//
//  Created by Nick Geary on 12/19/18.
//  Copyright © 2018 Quibi. All rights reserved.
//

import Foundation

class BrowseableItem {
    
    var img: String?
    var title: String?
    var genres: String?
    
    init(img: String, title: String, genres: String) {
        self.img = img
        self.title = title
        self.genres = genres
    }
    
}
