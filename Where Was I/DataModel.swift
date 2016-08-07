//
//  DataModel.swift
//  Where Was I
//
//  Created by Peter Leung on 7/8/2016.
//  Copyright © 2016 winandmac Media. All rights reserved.
//

import Foundation

class VisitedPoint {
    
    var latitude : String
    var longitude : String
    
    init(lat: String, long: String) {
        self.latitude = lat
        self.longitude = long
    }
}
