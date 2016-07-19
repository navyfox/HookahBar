//
//  HookahBar.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 19.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import Foundation

class HookahBar {
    var name: String
    var type: String
    var image: String
    var location: String
    var isViseted: Bool = false

    init(name: String, type: String, image: String, location: String, isViseted: Bool) {
        self.name = name
        self.type = type
        self.image = image
        self.location = location
        self.isViseted = isViseted
    }
}
